## 7. Windows 10 (Client1) Setup

With my Domain Controller fully set up, the next step was to integrate my Windows 10 machine into the `mreyna.com` domain so it could authenticate users, receive DHCP leases, and participate in the lab network.

---

### 7.1 Verifying Network Configuration
Before joining the domain, I made sure the Windows 10 client was configured to use the Domain Controller as its primary DNS server. Without this, domain lookups would fail.

**The steps to configure the clients network are the same as the AD server.** 

**What I did:**
1. Before starting the Windows 10 VM, I made sure that the adapter settings through virtual box was set to `Internal Network` and the name being `intnet`. I also made sure that no other adapters were enabled.  
2. Edited the IPv4 settings to:
   - **Obtain IP address automatically** (via DHCP from the DC)
   - **Preferred DNS server**: `172.16.0.1`
3. Ran `ipconfig /release` and `ipconfig /renew` in Command Prompt to confirm I got an IP from the correct DHCP scope.

---

### 6.2 Testing Connectivity
I verified communication with the Domain Controller by:
- **Pinging** `172.16.0.1` (IP)
- **Pinging** `mreyna.com` (FQDN)
- Using `nslookup mreyna.com` to confirm DNS resolution was working properly.

---

### 6.3 Joining the Domain
Once connectivity was confirmed, I joined the Windows 10 client to the domain.

**Steps:**
1. Opened **System Properties** (`sysdm.cpl`).
2. Clicked **Change** under Computer Name.
3. Selected **Domain** and entered: `mreyna.com`.
4. Entered the credentials for the domain admin account (`a-mreyna`).
5. Restarted the system after the success message.

---

### 6.4 Verifying the Join
After rebooting, I logged in using the domain account:
- **Username**: `MREYNA\a-mreyna`
- Confirmed the machine appeared in **Active Directory Users and Computers** under the **Computers** container.

---

### 6.5 Screenshots
I included the following screenshots for this section:
- **Windows 10 IP configuration showing DHCP lease**
- **Ping and nslookup results**
- **Domain join confirmation dialog**
- **Computer object in ADUC**

![Win10 DHCP](images/win10-dhcp.png)  
![Domain Join](images/domain-join.png)  
![ADUC Computer Object](images/aduc-computer.png)

---

At this stage, my client machine could log in to domain accounts, resolve internal DNS queries, and communicate with the Domain Controller — completing the core foundation of the Active Directory lab environment.
