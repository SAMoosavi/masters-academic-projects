#include <windows.h>
#include <stdio.h>

int main(void)
{
    DWORD pid = GetCurrentProcessId();
    DWORD tid = GetCurrentThreadId();

    HANDLE heap = GetProcessHeap();

    void* buffer = HeapAlloc(heap, 0, 128);

    if (buffer != NULL) {
        ZeroMemory(buffer, 128);
        HeapFree(heap, 0, buffer);
    }

    HANDLE event = CreateEventW(NULL, FALSE, FALSE, NULL);

    if (event != NULL) {
        SetEvent(event);
        WaitForSingleObject(event, 10);
        CloseHandle(event);
    }

    printf("PID: %lu\n", pid);
    printf("TID: %lu\n", tid);

    return 0;
}