# Environment Setup

This section details how I configured the virtual environment for my Active Directory lab using **Oracle VirtualBox**.

---

## Virtual Machines
1. **VM 1 – Domain Controller**
   - **OS:** Windows Server 2025 (Insider Preview ISO)
   - **Role:** Active Directory Domain Controller
   - **Network:** Dual-adapter configuration (NAT + Internal Network)

2. **VM 2 – Client Machine**
   - **OS:** Windows 10 ISO
   - **Role:** Domain-joined workstation
   - **Network:** Internal Network (communication with Domain Controller)

---

## Resource Allocation
To ensure smooth performance, I allocated:
- **RAM:** Minimum 2 GB for Server, 2 GB for Client
- **CPU:** 2 cores per VM
- **Storage:** 50 GB for Server, 50 GB for Client

This resource allocation balances performance and efficiency, simulating realistic enterprise hardware constraints.

---

## Networking Configuration
One of the most important and rewarding aspects of this setup was configuring the **dual network adapter** for the Domain Controller:
- **Adapter 1 – NAT:** Provided internet access for OS updates and package downloads.
- **Adapter 2 – Internal Network:** Enabled isolated communication with the Windows 10 client.

This mirrors **real-world network segmentation** practices, where internal systems are isolated from the public internet for security purposes, while still allowing controlled access for administrative tasks.
