# Internet of Vehicles in Big Data Era

**Authors:** Wenchao Xu, Haibo Zhou, Nan Cheng, Feng Lyu, Weisen Shi, Jiayin Chen, Xuemin (Sherman) Shen
**Published:** IEEE/CAA Journal of Automatica Sinica, Vol. 5, No. 1, pp. 19–35, January 2018
**DOI:** 10.1109/JAS.2017.7510736
**Affiliations:** University of Waterloo (Xu, Cheng, Shi, Chen, Shen), Nanjing University (Zhou), Shanghai Jiao Tong University (Lyu)
**Funding:** NSFC (91638204), NSERC Canada

---

## Abstract

The article investigates the two-way relationship between Internet of Vehicles (IoV) and Big Data. First, how IoV supports big data acquisition, transmission, storage, and computing in the vehicular environment. Second, how IoV benefits from big data for network characterization, performance evaluation, and communication protocol design. It then examines IoV big data applications for autonomous vehicles and closes with emerging research issues.

---

## 1. Introduction & Context

- **Vehicular data explosion:** Global vehicular traffic is predicted to reach 300,000 Exabytes by 2020; one fifth of vehicles on the road are expected to have Internet connections. Driven by automotive telematics and applications for driving safety, in-vehicle infotainment, and Intelligent Transportation Systems (ITS).
- **VANETs → IoV:** Traditional Vehicular Ad-Hoc Networks (VANETs) treat vehicles as network nodes relaying data over Vehicle-to-Vehicle (V2V) and Vehicle-to-Infrastructure (V2I) links. Modern vehicles carry powerful processing units and large storage, so they become "networked computing centers" with intelligent processing capability — this evolution, connecting large-scale intelligent vehicles via advanced telematics, defines the IoV.
- **Big data in vehicles:** Data volume and type expand massively (200+ sensors per vehicle predicted by 2020, ~4000 GB generated per day), while demands rise for strict QoS (bounded delay, high delivery rate, massive connections).
- **Reciprocal relationship (two-folder):**
  1. IoV supports big data acquisition, transmission, storage, and computing.
  2. IoV benefits from mining big data for characterization, performance analysis, and intelligent protocol design.

---

## 2. Big Data Support in IoV

### 2.1 Big Data Acquisition

Data comes from four sources: vehicles, passengers, roadside facilities, and the Internet.

**On-board vs. on-road data:**
- **On-board data** — vehicle status (velocity, engine parameters, brake status) from in-vehicle sensors.
- **On-road data** — road event information from on-board sensors (inter-vehicle distance, blind-spot objects, camera video) or via IoV connections (traffic light status, neighbor brake notifications, road maps).

**Sensing & application bandwidth (Table I):**

| On-board Sensing | Bandwidth | On-road Sensing | Bandwidth | IoV Application | QoS |
|---|---|---|---|---|---|
| GPS (vehicle position) | ~50 KBps | Radar | 10–100 KBps | Vehicle management | Ubiquitous connection |
| Driving state (velocity, tire pressure) | ~100 KBps | Sonar | 10–100 KBps | In-vehicle HD video streaming | Large bandwidth |
| ECU (coolant temp, RPM) | ~100 KBps | Lidar | 10–70 MBps | Autonomous driving | High delivery rate with delay constraint |
| Accidental events (brake, collision) | Small | Camera | 20–40 MBps | HD map | High data volume |

- **Lidar and Camera** generate the most data (MBps range), critical for autonomous driving and navigation.
- **Passenger smart devices** (GPS chips, gyroscopes) provide trajectory and accelerometer data; smartphones are used as road traffic/condition probes; vehicular social networks add social data.
- **Space/aerial platforms** — satellites, High Altitude Platforms (HAPs, at ~20 km altitude with 20–30 km coverage radius), and drones/UAVs — offer two main advantages:
  1. **Enhanced coverage:** wider geographic data acquisition; drones monitor more ground devices in Line-of-Sight than ground vehicles.
  2. **Specific data acquisition:** GPS-based positioning, HAPs for rural data collection, drone cameras for traffic surveillance.
- Heterogeneous radio technologies plus aerial extension make acquisition ubiquitous but increasingly complex.

### 2.2 Big Data Transmission

**Application classes & requirements:**
- **Road safety** (collision avoidance, emergency movement warning): periodic status beacons (position, velocity, heading, acceleration, turn signals), 200–500 byte messages, low data rate but strict latency/reliability under high mobility.
- **Travel comfort** (announcements, ads, parking info, traffic conditions): delay-tolerant, often needs longer-range dissemination (e.g., taxis/buses as seed vehicles for mobile advertising).

**Five transmission challenges in IoV:**
1. **Harsh wireless channel conditions** — buildings, tunnels, bridges, multi-path fading cause unstable V2V links.
2. **Spectrum resource shortage** — FCC allocates only 75 MHz for DSRC (CCH + SCHs, 10/20 MHz optional bandwidth), insufficient for high-density media-rich applications.
3. **High mobility** — frequent link interruption, topology churn, random interference, and frequent Internet access switching overhead.
4. **Dynamic vehicle density** — congestion in jams, wasted resources in sparse areas; protocols must adapt.
5. **Absence of global coordination** — heterogeneous access networks over wide areas make centralized coordination impractical; protocols must work distributedly.

**Transmission methodology:**
- **Application-aware strategies (push/pull):** *Push* periodically broadcasts regardless of requests (safety messages — plain flooding causes broadcast storms; mitigation via weighted p-persistence, slotted 1-persistence, slotted p-persistence). *Pull* transmits on request (lower overhead, extra latency; caching used to reduce delay). Hybrid combines both.
- **MAC protocols:**
  - *Contention-based:* IEEE 802.11p (amendment to 802.11a/Wi-Fi), CSMA/CA-based DCF. Drawbacks: unbounded delays under high density; broadcast mode omits RTS/CTS/ACK → hidden terminal problem.
  - *Contention-free:* TDMA (frame/slot structure guarantees channel access; ADHOC MAC with R-ALOHA reservation, VeMAC assigns disjoint slots to opposite-direction traffic and RSUs; issues: merging collisions), SDMA (location-based slot mapping; wastes bandwidth at low/uneven density), CDMA (PN-code based; long codes reduce resource utilization at high density, receivers must store every sender's PN code).
- **Routing protocols:**
  - *Topology-based:* proactive (table-driven, high sync overhead), reactive/on-demand (route discovery on demand; suited to frequent topology changes), hybrid (proactive inside region, reactive outside).
  - *Position-based:* use vehicle position + maps/navigation data; no route discovery needed, but greedy forwarding may fail under sparse conditions → unbounded delay (carry-and-forward, data mule).
- **Aerial extension** — satellites, HAPs, drones improve transmission by:
  1. **Ubiquitous connectivity:** coverage in rural areas (HAPs, satellites) and extra spectrum in dense scenarios.
  2. **LoS A2G connections:** aerial platforms overcome NLoS blockages that dominate V2V outages (e.g., Lyu et al. empirical study).
  3. **Dynamic deployment:** flexible UAV relocation adapts to peak-hour traffic bursts where fixed infrastructure is impractical.
  - Applications: GPS positioning; HAP broadband (47/48 GHz, ~25 Mbps); drones for traffic monitoring, relay/A2G connectivity, and UAV-assisted routing (e.g., UAVR routing protocol guiding vehicles to best multi-hop paths).

### 2.3 Big Data Storage

**Storage types:**
- **On-board:** OBU with extensible interfaces (USB); NVIDIA self-driving learning system uses SSD extendable to several TB; Baidu Apollo Industrial PC with 1 TB HDD; Cohda OBU runs Linux with ext4; passenger smartphones add tens of GB.
- **Roadside:** RSUs with on-board storage (e.g., Cohda Wireless RSU, 10 GB + USB), roadside Wi-Fi hotspots, road dropboxes for drive-by content store-and-forward.
- **Internet:** cloud storage (OneDrive, Dropbox) for offloading; authorized access to other vehicles'/facilities' storage.

**Storage mechanisms (by access delay):**
- **Fast storage** — on-board devices and passenger smart devices (guaranteed delay) for delay-sensitive apps (safety, autonomous driving).
- **Medium storage** — externally connected via reliable connection (e.g., cellular multi-hop + backhaul); larger delay.
- **Slow storage** — opportunistic V2V/V2R connections; unbounded delay (used for delay-tolerant content).

**Caching/dissemination:** V2V-assisted content delivery (Zhao et al. caching in forwarding vehicles), VCC-based storage resource allocation via semi-Markov decision process (Zheng et al.), RSU as network cache for popular content (Ding et al.), mobility-aware edge caching (Mahmood et al.).

### 2.4 Big Data Computing

- **On-board computing:** ECU history from the 1970s (electronic fuel injection, engine/emission control); connected vehicles additionally handle infotainment and V2X protocol stacks; NVIDIA DRIVE PX integrates deep learning, sensor fusion, real-time vision processing (24 trillion DL operations/sec).
- **Roadside/edge computing:** RSUs with multi-core CPUs running modern OS (Cohda RSU MK5: Cortex-A8 ARMv7, Linux 3.10) support cooperative computing.
- **Vehicular Cloud Computing (VCC):** vehicles (moving and parked — airports, shopping malls) form mobile computing clouds providing computing-as-a-service (Arif et al. airport parking-lot data center; Zheng et al. SMDP-based resource allocation; Zhang et al. smartphone task offloading).
- **Cooperative computing:** V2V request-response to pool resources for tasks beyond single-vehicle capability (e.g., cooperative road-condition computation, routing next-hop calculation).
- **Formation control:** platooning/clustering relies on computing mobility status of adjacent vehicles (V-PADA platoon-aware data access scheme).

---

## 3. Big Data Enabled IoV

### 3.1 IoV Characterization and Performance Evaluation

**Measurement-driven analysis:** Real-world ground measurements characterize IoV in urban, suburban, rural, open-field, and freeway scenarios.
- **Packet Delivery Ratio (PDR)** as the main V2V reliability indicator; temporal/spatial/symmetric correlation functions (Bai et al. black-box framework).
- **T-window reliability** — probability of successful transmission within tolerance window T (Karedal et al.).
- **Channel characteristics:** path loss, Doppler spectrum, coherence time; speed-separation diagram to predict coherence time/Doppler spread; constant delay and zero Doppler observed under typical traffic (Paier et al.); 802.11p validated against Doppler/delay spreads; packet size and modulation affect retransmission and range.

**Trace-driven models:**
- Real GPS/trace data (California, Shanghai, San Francisco) build realistic mobility models; SUMO microscopic models calibrated with traces (Akhtar et al.); inter-contact time tail distributions (Zhu et al.); trajectory gap filling via route prediction (Celes et al.).
- Channel models (log-normal shadowing, geometry-based stochastic) parameterized by comparing traces with theory in urban/suburban/rural/highway scenarios.

### 3.2 IoV Protocol Design with Big Data Intelligence

**Big-data-aware protocol design:**
- Big data guides network topology and channel modeling; position information helps MAC/routing adapt to high mobility.
- Position-based routing outperforms topology-based in adaptivity and scalability.
- Prediction-based designs: **PRHMM** (Hidden Markov Model routing reducing overhead and buffer occupancy), lifetime-prediction routing (longer-lived, lower-loss links), **DAER** (distance-aware epidemic routing), **GPSR**, **PTMAC** (prediction-based TDMA MAC predicting encounter collisions), **RPBMACN** (relative-position-based collision-free MAC with directional antennas).
- Optimization of transmission via predicted traffic flow, short-term routes, and node position (delay, hop count, delivery ratio).

**Connectivity enhancement:**
- Vehicle movement data predicts imminent cell handovers → seamless handoff schemes (behavior/location/time-of-day-based prediction; handoff time estimation + available bandwidth estimation for bandwidth reservation; PRHMM for future-location prediction).
- UAVs collect traffic info and guide ground vehicles for efficient routing (Oubbati et al.).

### 3.3 IoV Big Data for Autonomous Vehicles

IoV big data is a key enabling technology for autonomous vehicles (predicted >1 TB data/hour generated by self-driving vehicles; ~1 GB/sec per car).

**Environment perception:**
- On-board sensors (cameras, radar, Lidar, GPS) plus shared data from connected vehicles (road conditions, traffic) provide abundant, often redundant, data.
- Classic computer vision (SIFT, SVM) fails on complex tasks; **deep learning with DNNs/CNNs** on large labeled datasets (ILSVRC, KITTI, CityScapes) dominates: ORB-SLAM monocular SLAM, FlowNet (CNN optical flow), vehicle appearance learning, RGB+LiDAR pedestrian detection.
- Virtual mapping of real sensor data into test spaces enables data-driven testing; semantic driving-intelligence definitions combine scenario- and functionality-based tests.

**HD maps:**
- Prerequisite for fully autonomous driving: accurate positioning + virtual image of the vehicle's vicinity.
- Lidar point clouds; far more detail than traditional maps (lanes, signs, traffic lights, bumps/holes); **~several GB per kilometer**.
- Generation/maintenance is costly (LiDAR-equipped fleets); ground + aerial image parsing reduces expense (Máttyus et al.); precision localization by correlating LiDAR with HD maps outperforms GPS-IMU-odometry by over an order of magnitude.

**End-to-end self-driving:**
- **Direct mapping:** image → steering control (NVIDIA/Tesla end-to-end learning).
- **Mediate method:** images → perception indicators (road/traffic state) → driving decisions.
- Current leaders: Google/Waymo, Tesla Autopilot, Intel Mobileye (parse entire scene for actuation decisions).

**Autonomous vehicle challenges:**
1. **Storage/computing:** massive high-speed storage (HD maps + real-time sensor data) and very high computation for fusion and deep learning; on-board solutions (Nvidia DRIVE PX) are expensive.
2. **Communication:** cloud offloading requires massive connections, very high data rates, low latency.
3. **Ethics:** ethical dilemmas in autonomous decision-making.
4. **Security & privacy:** IoV data security and privacy are major concerns (remote sensor attacks, cybersecurity).

---

## 4. Emerging Issues

### 4.1 Big Data Aware IoV Development

**Data sourcing & preprocessing:**
- IoV should gather, process, and relay more data from larger scopes; **crowd-sourcing** obtains road information across geographic positions and time moments.
- **Redundancy pruning:** raw data has heavy redundancy (source correlation; same area sensed at different drive-by times); pruning reduces transmission, storage, and processing overhead.
- **Multi-source integration:** road condition data from vehicles, RSUs, and UAVs integrated near the scene before transmission to remote management centers.

**IoV network protocols:**
- Protocols should be designed per data type/radio tech (e.g., TDMA MAC guarantees safety-message delivery delay).
- Must be **scalable** to network size and changing topology; **data-aware** (type, source, users) — recognizing data source helps distinguish legitimate providers from malicious attackers, improving security; QoS-aware per upper-layer requirements, e.g., via **software-defined IoV** (flat network architecture).
- **Standardization** of IoV protocols is important for popularization of big-data-enabled IoV.

### 4.2 Big Data Powered IoV Services

- **HD map aggregation:** road data collected by vehicles aggregated at RSUs → shared HD map for passing vehicles.
- **Real-time navigation:** traffic conditions inferred from vehicle mobility data → best-route sharing and real-time navigation.
- **Queryable data services** based on ubiquitous sensing per customer interest (encrypted fine-grained multi-keyword search).
- **Social networks on wheels** expanded by IoV big data.
- **ITS–smart grid convergence** for an electrified future transportation ecosystem.
- Business models for the IoV service market are still immature; driving safety, road management, and autonomous vehicles are expected key scenarios.

---

## 5. Key Conclusions

1. **Reciprocal relationship:** IoV supports big data (acquisition, transmission, storage, computing); big data enhances IoV (characterization, performance analysis, protocol design) — a mutualism to guide IoV development.
2. **Data is central:** massive, diverse data generation is the defining characteristic of the IoV big data era.
3. **Autonomous driving:** IoV big data is a key enabler for self-driving vehicles (perception, HD maps, end-to-end learning).
4. **Future directions:** big-data-aware IoV development and big-data-powered IoV services are the paths forward; security/privacy and protocol standardization remain open.

---

## 6. Key Terminology

| Term | Definition |
|------|------------|
| **IoV** | Internet of Vehicles |
| **VANET** | Vehicular Ad-Hoc Network |
| **V2V / V2I / V2X** | Vehicle-to-Vehicle / Infrastructure / Everything |
| **DSRC** | Dedicated Short Range Communication (IEEE 802.11p) |
| **OBU / RSU** | On-Board Unit / Roadside Unit |
| **HAP / UAV** | High Altitude Platform / Unmanned Aerial Vehicle |
| **LoS / NLoS / A2G / A2A** | Line-of-Sight / Non-Line-of-Sight / Air-to-Ground / Air-to-Air |
| **MAC** | Medium Access Control (TDMA, SDMA, CDMA, CSMA/CA, DCF) |
| **GPSR** | Greedy Perimeter Stateless Routing |
| **PRHMM** | Prediction-based Routing via Hidden Markov Model |
| **PTMAC** | Prediction-Based TDMA MAC |
| **VCC** | Vehicular Cloud Computing |
| **ECU** | Engine Control Unit |
| **Lidar / HD map** | Laser scanning sensor / High-Definition Map (several GB/km) |
| **DNN / CNN / SLAM** | Deep/Convolutional Neural Network / Simultaneous Localization and Mapping |
| **ITS** | Intelligent Transportation System |
| **SUMO** | Simulation of Urban MObility (mobility model) |
| **QoS** | Quality of Service |

---

## 7. Key References

- IEEE 802.11p-2010 Standard (Wireless Access in Vehicular Environments)
- Xu et al., "Vehicle-to-vehicle safety messaging in DSRC" (2004)
- Omar et al., "VeMAC: A TDMA-based MAC protocol for reliable broadcast in VANETs"
- Bai & Krishnan, "Reliability analysis of DSRC wireless communication for vehicle safety applications"
- Lyu et al., "An Empirical Study on Urban IEEE 802.11p V2V Communication" (SECON 2016)
- Cheng et al., "Vehicular WiFi offloading: challenges and solutions" (Vehicular Communications 2014)
- Zheng et al., "An SMDP-based resource allocation in vehicular cloud computing systems"
- Bojarski et al., "End to end learning for self-driving cars" (NVIDIA)
- KITTI dataset (Geiger et al.), CityScapes dataset (Cordts et al.)
- Seif & Hu, "Autonomous Driving in the iCity — HD Maps as a Key Challenge" (Engineering 2016)
- Karp & Kung, "GPSR: Greedy perimeter stateless routing" (2000)
- Motlagh et al., "Low-altitude UAV-based IoT services: comprehensive survey" (IEEE IoT Journal 2016)

---

*Summary generated for seminar review purposes from the full extracted text of Xu et al. (2018), IEEE/CAA J. Automatica Sinica, vol. 5, no. 1, pp. 19–35.*
