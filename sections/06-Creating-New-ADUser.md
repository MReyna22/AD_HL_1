## Creating Users, Groups, and Organizational Units (OUs)

With the domain fully operational, I shifted focus to building out the Active Directory structure for users, groups, and OUs. This step is critical in any enterprise environment because it lays the foundation for security, scalability, and daily administrative efficiency.

### Organizational Units (OUs)
I began by designing a logical OU hierarchy to separate accounts based on their function and security needs. I created dedicated OUs for:
- **Departments** (IT, Engineering, and Management) for applying department-specific Group Policy Objects (GPOs)
- **Service Accounts** to isolate non-human accounts with unique security considerations
- **Administrative Roles** for privileged accounts requiring stricter access controls

This structure makes it easy to target GPOs, apply permissions, and troubleshoot issues without impacting unrelated accounts.

### Groups
I created a groups within each department and assigned a manager per group. Each group having their own share folder titled **Xshare** 

### User Accounts
I then created user accounts using a standardized naming convention (e.g., first initial + last name) for easier identification and management. Each account was populated with:
- Username and display name- Department information
- Appropriate group memberships

For administrative accounts, I applied specific settings such as “Password never expires” (only where operationally justified) and enabled additional security controls.

Everyone else is designated a random password. I applied the setting for them to change their password upon first logon. 

### PowerShell Automation (Mass)
To speed up provisioning and reduce human error, I used a PowerShell script to:
- Bulk-create multiple user accounts at once
- Assign the correct security group memberships
- Place each account into the right OU automatically

### PowerShell Automation (Single)
For a single user creation, I created a PowerShell script that allows for a more specific configuration. The script automatically assigns a random password to each new user. It also stores the information (name, username, password, etc.) into a secure file on the admin account. 

These automation not only mirrors real-world onboarding workflows but also demonstrates the importance of scripting in large-scale and security specifications in operations. 

### GPO practice for all user accounts
As a fun excersise to get familiar with creating GPOs, I set the domain desktop wallpaper to a baby raccoon. 

1. On the Windows Server VM, sign in using your **Administartor** account.
2. On the **Server Manager** page, go to the left side and click on **File and storage Services**.
3. On the **Servers** page, go to **Shares** and click on it.
4. There should be three share folders. Right click on **NETLOGON** and click on **Open Share**.
5. The File Explorer for **NETLOGON** should appear. Minimize that page.
6. Click on **Microsoft Edge** to browse for a picture.
7. I chose a baby raccoon, you can choose whatever you like. Save your preferred image on your desktop.
8. Open the **NETLOGON** window and copy your photo onto the there from your desktop. Once the photo is on there, right click on the photo, then click on **Copy as path**. 
9. Going back to Server Manager window, click on **Tools**, click on **Group Policy Management**.
10. So that the GPO affects everyone in the domain, I'm going to expand the **Domains** folder, right click on my domain, click on **Create a GPO in this domain, and Link it here...**.
11. Name the GPO **Domain Wallpaper**. For **Source Starter GPO** leave it at (none). Click OK.
12. It should be added under the domain forest, right click on the GPO and click **Edit...**
13. Click on **User Configuration**, **Policies**, **Administrative Template**, **Desktop**, **Desktop**, double click on **Desktop Wallpaper**.
14. Change to **Enable**. Under **Options** and **Wallpaper Name:** Paste the path of the photo. **MAKE SURE TO REMOVE THE QUOTATIONS FROM BOTH ENDS OF THE PATH OR IT WILL NOT WORK.**
15. Click **Apply** then OK.
16. To prevent users from changing the wallpaper, under **User Configuration**, **Policies**, **Administrative Template**, **Control Panel**, **Personalization**, click on **Prevent changing desktop background**, then click **Enable**, **Apply**, **OK**.
17. Exit out until you are on the main **Group Policy Management** page displaying your new GPO for the whole domain server.
18. On your Windows 10 VM, sign in to a random domain user. After logging in, you should see that the desktop has now changed to your photo.  

### Outcome
The result is an Active Directory environment that is:
- **Organized** with a clear and scalable OU hierarchy
- **Secure** through RBAC and adherence to the principle of least privilege
- **Efficient** thanks to automation-driven provisioning
- **Ready for growth**, making it easy to onboard new hires or restructure departments without disruption

### Skills Demonstrated
- Active Directory design and administration
- Group Policy Object (GPO) targeting and practices
- Role-Based Access Control (RBAC) implementation
- User provisioning and lifecycle management
- PowerShell scripting for automation
- Enterprise security best practices

---
## PowerShell Scripts Used
-The mass user creation script was created by Josh Madakor. Here is his GitHub page with the files: https://github.com/joshmadakor1/AD_PS

-Here is the script I made: 
[Script for creating new AD users with random password assignment and information log](../Scripts/Create_New_ADUser.ps1) 

## Screenshots

Below are screenshots showing the OU structure, security groups, and user accounts as configured in this section.

**-OU Structure**

![Screenshot of OU Structure](../images/screenshots/ou-structure.png)

**-Security Groups**

![Screenshot of Security Groups](../images/screenshots/security-groups.png)

**-User Accounts**

![Screenshot of User Accounts](../images/screenshots/user-accounts.png)

**-PowerShell Automation Output**

![Screenshot of PowerShell Script Results](../images/screenshots/powershell-output.png)

**-GPO practice for all user accounts**

![Screenshot of GPO Results](../images/screenshots/GPO_LockScreen.png)
