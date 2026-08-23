# Connected Vehicles: Solutions and Challenges

- **Authors:** Ning Lu, Nan Cheng, Ning Zhang, Xuemin Shen, Jon W. Mark (University of Waterloo, Canada)
- **Venue:** IEEE Internet of Things Journal, Vol. 1, No. 4, August 2014
- **DOI:** 10.1109/JIOT.2014.2327587

## Abstract

Providing various wireless connectivities for vehicles enables communication between vehicles and their internal and external environments. Such a connected-vehicle solution is expected to be the next frontier for the automotive revolution and the key to the evolution to next-generation Intelligent Transportation Systems (ITSs). Connected vehicles are also the building blocks of the emerging Internet of Vehicles (IoV). The paper focuses on wireless technologies and potential challenges for providing vehicle-to-x (V2X) connectivity: it discusses the challenges and reviews the state-of-the-art wireless solutions for vehicle-to-sensor (V2S), vehicle-to-vehicle (V2V), vehicle-to-Internet (V2I), and vehicle-to-road infrastructure (V2R) connectivities, and identifies future research issues.

## 1. Introduction — Motivations and Scope

**Why connected vehicles?** Motor vehicles have continuously evolved since the Second Industrial Revolution. With the rapid development of information and communication technologies (ICT), equipping automobiles with wireless communication capabilities is expected to be the next frontier of the automotive revolution. Connected vehicles are proactive, cooperative, well-informed, and coordinated, and support applications for:

- **Road safety** — collision detection, lane change warning, cooperative merging
- **Smart and green transportation** — traffic signal control, intelligent traffic scheduling, fleet management
- **Location-dependent services** — point of interest, route optimization
- **In-vehicle Internet access**

**Two driving forces:**

1. **Efficiency and safety of road transportation.** Urbanization increases vehicle populations and causes traffic congestion. In 498 U.S. urban areas, the cost of extra travel time and fuel due to congestion reached **USD 121 billion in 2011**, and produced **56 billion pounds of CO₂** during congestion (vs. USD 24 billion and 10 billion pounds in 1982). Connected-vehicle solutions can alleviate congestion via intelligent traffic control/management and improve safety via on-board warning and driving-assistance systems.
2. **Ever-increasing mobile data demand of users on the road.** People expect the same connectivity in their cars as at home and at work. Internet connectivity also enriches safety-related applications such as online diagnosis and intelligent anti-theft/tracking (with servers in the Internet cloud).

**Industry/government momentum:**
- Global connected-vehicle market expected to reach **USD 131.9 billion by 2019**
- Percentage of Internet-integrated vehicle services predicted to jump from **10% to 90% by 2020**
- European Commission proposed a mandatory **eCall** system from 2015 (cars automatically link to emergency services after a collision)
- U.S. NHTSA/DOT announced steps to enable communications between light vehicles

**Definition:** Connected vehicles are wireless connectivity-enabled vehicles that can communicate with their internal and external environments via four interactions: V2S (on-board sensors), V2V, V2R, and V2I. These interactions create multiple levels of data pipelines to in-vehicle information systems, enhancing situational awareness and providing an information-rich travel environment. Connected vehicles are the building blocks of the **Internet of Vehicles (IoV)** — a dynamic mobile communication system for gathering, sharing, processing, computing, and securely releasing information — and enable the evolution to next-generation ITS.

## 2. Intra-Vehicle Connectivity (V2S)

Modern vehicles are equipped with many sensors (road conditions, driver fatigue, tire pressure, water temperature, autonomous control), forecast to reach **200 sensors per vehicle by 2020**. Sensors report event-driven or time-driven messages to Electronic Control Units (ECUs). Wired solutions (CAN, FlexRay, TTEthernet) add significant weight — cables and accessories can add up to **50 kg** — and aftermarket sensor installation is inconvenient. A wireless intra-vehicle sensor network reduces deployment cost and complexity.

**Favorable characteristics:** (1) sensors are stationary (topology does not change); (2) sensors connect to the ECU via one hop (simple star topology); (3) no energy constraint (vehicle power system).

**Challenges:** harsh in-vehicle channel (severe scattering in limited space, frequent non-line-of-sight); low latency and high reliability required for real-time control; interference from neighboring vehicles in dense urban scenarios; security against malicious attacks on the in-vehicle network/control system.

**Candidate wireless technologies:**

| Technology | Key facts | Pros / Cons |
|---|---|---|
| **Bluetooth** (IEEE 802.15.1, 2.4 GHz ISM) | Up to 3 Mb/s, highly commercialized | High power requirement — not viable for battery-driven sensors; poor scalability (only 8 active devices: 1 master + 7 slaves) |
| **ZigBee** (IEEE 802.15.4, ISM 868/915 MHz / 2.4 GHz) | 250 kb/s in 2.4 GHz band | Low cost, acceptable data rate, viable in-vehicle (field experiments); challenge: engine noise and Bluetooth interference; MAC design needed to meet hard latency requirements |
| **RFID** (passive tags + reader at ECU) | Reader sends energizing pulses to retrieve data | Low cost, no power to tags, promising coherence bandwidth and reliability; challenges: connection outage from large power loss (solution: advanced antennas or active RFID wired to battery) and collisions among simultaneous transmissions (solution: efficient MAC protocols) |
| **Ultra-Wideband (UWB)** (3.1–10.6 GHz, ~7.5 GHz bandwidth; ECMA-368/WiMedia) | Short range, up to 480 Mb/s, very low energy | Resistant to fading/shadowing, high time resolution for localization/tracking, low cost and complexity; testbed delivered wheel-speed data to ECU with high reliability; channel models exist for passenger compartment, engine compartment, trunk, and beneath chassis |
| **60 GHz Millimeter Wave** (57–64 GHz; IEEE 802.15.3c, IEEE 802.11ad) | Multi-Gb/s short-range links | Enables bandwidth-intensive multimedia (e.g., HD video to seat monitors); main challenge is severe propagation loss — propagation characterization is the first priority |

## 3. Inter-Vehicle Connectivity (V2V)

V2V communications disseminate information generated by vehicle-borne computers, control systems, sensors, or passengers to vehicles in proximity or multiple hops away, forming a Vehicular Ad hoc Network (VANET) with no built infrastructure. They enable active road-safety applications (collision detection, lane change warning, cooperative merging) and infotainment applications (interactive gaming, file/information sharing).

**Challenges:** harsh environment — LOS often blocked by buildings at intersections, trucks attenuate signals and cause packet loss on highways; multipath fading, shadowing, and Doppler effects from high mobility; mutual interference with large-scale simultaneous transmission; lack of a unified channel model (existing models cover only specific scenarios such as urban/rural/highway).

**Enabling features:** mobility is map-restricted and partly predictable; no power constraint and relatively powerful processing on vehicles; GPS provides location with error of a few meters.

**Solutions discussed:**

- **DSRC/WAVE** — the key enabling technology for V2V and V2R. The U.S. FCC allocated **75 MHz at 5.9 GHz**, divided into **7 channels** to support safety and nonsafety services simultaneously. Specified by IEEE 802.11p (PHY/MAC) and the IEEE 1609 family (upper layers).
  - **PHY layer:** OFDM similar to IEEE 802.11a/g, 3–27 Mb/s on a 10 MHz channel. Challenges: reliability not guaranteed when LOS is obstructed or delay spread is large; cross-channel interference; a "gray-zone" phenomenon of intermittent loss rate.
  - **MAC layer:** safety messages (time-driven/periodic or event-driven) rely on one-hop broadcast, but the legacy IEEE 802.11 DCF is contention-based and does not support efficient, reliable broadcast (RTS/CTS and ACK are not used for broadcast). TDMA-based alternatives (listening/broadcasting in acquired time slots) are proposed to guarantee QoS in dense scenarios.
- **Dynamic Spectrum Access (DSA)** over **TV white space** (54–698 MHz) — a complementary technology motivated by spectrum scarcity (infotainment video streaming demand; high vehicle density in urban areas). TV white space offers superior propagation and building penetration vs. DSRC. IEEE 802.11af (WLAN) and IEEE 802.22 (WRAN) standardize DSA over TV white space. A V2V cognitive communication system over TV white space consists of three subsystems: (1) two-layer control channel; (2) multihop data communication; (3) spectrum sensing and channel switching. A geo-location database approach builds spectral maps of available channels. Early results show great potential (e.g., supporting a platoon of vehicles on a highway); remaining challenge is an efficient MAC with QoS provisioning for both safety and infotainment.

## 4. Vehicle-to-Internet Connectivity (V2I)

Internet access is becoming a must-have feature of modern vehicles. Cellular networks (3G, 4G-LTE) provide reliable, ubiquitous access; low-cost roadside WiFi access points have also been demonstrated for outdoor access at vehicular mobility.

**Industrial solutions (cellular-based):**
- **Brought-in connectivity** — tethering the user's smartphone: MirrorLink (Car Connectivity Consortium: Volkswagen, Toyota, Sony, Nokia), Apple CarPlay, and aftermarket devices such as GM OnStar (built-in cell phone providing subscription voice calls, emergency services, Internet access; no pre-embedded infotainment system required).
- **Built-in connectivity** — integrated cellular module: BMW ConnectedDrive, Audi connect, and the emerging **LTE-connected car** concept (4G-LTE vs. 3G: ultra-high speed, high bandwidth, lower cost; e.g., Alcatel-Lucent's ng Connect program, Verizon's LTE-car strategy). Limitation: the cellular connectivity cannot evolve once embedded.

**Drive-thru Internet (WiFi):** WiFi on unlicensed spectrum offers "last-hundred-meter" backhaul connectivity at low cost; enabled by built-in WiFi radios or WiFi-enabled mobile devices. Passpoint/Hotspot 2.0 adds secure connectivity and seamless roaming; urban-scale WiFi (e.g., Google WiFi in Mountain View) promises rapid growth.

- **Characteristics/challenges:** very short connection times — the ~500–600 m AP range corresponds to only **18–21 s of connection at 120 km/h**; WiFi association/authentication/IP configuration overhead; high wireless loss from fading/shadowing; protocol stack not designed for high mobility. Drive-thru access has a three-phase (entry, production, exit) behavior.
- **Real-world measurements:** In Boston in-situ WiFi AP tests at a fixed 1 Mb/s rate, vehicles achieved a **median upload throughput of 240 kb/s**, a **median one-drive-thru uploaded data volume of 216 kB**, with **average connection time of 13 s and inter-connection time of 75 s**; a long-term throughput of **86 kb/s** (averaged over connection and inter-connection periods). Backhaul limitation: a 1 Mb/s backhaul reduces data volume per drive-thru from **92 to 25 MB**; a 100 ms one-way backhaul delay significantly degrades web services.
- **Improvement strategies:** reduce connection-establishment time; better transport protocols for intermittent connectivity/losses; MAC enhancements for high mobility; efficient handoff schemes; multihop V2V relaying of data; cooperation among vehicles; optimal WiFi AP deployment.

**Toward cost-effective solutions:** cellular access is reliable but costly (high CAPEX/OPEX), while WiFi drive-thru access is intermittent, compromising QoS — so cost-effectiveness of existing solutions remains uncertain. Approaches include hybrid 3G/WiFi network designs, fundamental throughput-vs-infrastructure-cost relations, and **WiFi offloading** of cellular traffic. Opportunistic WiFi offloading has unique features: (1) small data per drive-thru due to short connection times, and (2) significantly better performance if data delivery can be deferred (fast vehicles get multiple drive-thru opportunities soon).

## 5. Vehicle-to-Road Infrastructure Connectivity (V2R)

V2R connectivity is critical to avoid/mitigate road accidents and enable efficient ITS management. **DSRC/WAVE** is the key technology for connecting vehicles to ITS infrastructure (traffic lights, street signs, roadside sensors). Roadside units (RSUs) can also serve as commercial content providers (e.g., broadcasting store flyers) and do not necessarily act as Internet gateways.

**Visible Light Communication (VLC):** transmits data via light-emitting diodes (LEDs); a key technology in IEEE 802.15.7, supporting up to **96 Mb/s** through fast modulation of LED light sources. Proposed for road-to-vehicle ITS applications such as traffic-light control at intersections, complementing DSRC for LOS scenarios. Requires advanced receivers (e.g., high-speed cameras) to combat outdoor optical noise, which is costly; VLC is still in its introductory phase compared to mature IEEE 802.11-based technology.

## 6. Conclusion — Key Challenges and Research Directions

The biggest challenge for efficient, robust wireless connections is combating the harsh communication environment inside and/or outside the vehicle. Further R&D issues:

1. **Cost of multiple radio interfaces** — DSRC/WAVE, WiFi, and 3G/4G-LTE interfaces are needed, incurring high cost; a unified low-cost solution for V2X connectivity may be required.
2. **V2S performance gap** — in-vehicle systems demand stringent latency/reliability; full adoption of V2S connectivity is not feasible in the near future unless it matches the performance and reliability of wired communication.
3. **Driver information overload** — research shows an upper limit on the information presented to drivers; excessive information increases driver workload and harms safety, so in-vehicle information systems must be designed carefully.

---

*Full text extracted from: Connected Vehicles: Solutions and Challenges.pdf*
