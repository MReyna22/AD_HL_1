## 06 – Creating Users, Groups, and Organizational Units (OUs)

With the domain fully operational, I shifted focus to building out the Active Directory structure for users, groups, and OUs. This step is critical in any enterprise environment because it lays the foundation for security, scalability, and daily administrative efficiency.

### Organizational Units (OUs)
I began by designing a logical OU hierarchy to separate accounts based on their function and security needs. I created dedicated OUs for:
- **Departments** (IT, Engineering, and Management) for applying department-specific Group Policy Objects (GPOs)
- **Service Accounts** to isolate non-human accounts with unique security considerations
- **Administrative Roles** for privileged accounts requiring stricter access controls

This structure makes it easy to target GPOs, apply permissions, and troubleshoot issues without impacting unrelated accounts.

### Groups
I created a group within the Engineers OU 

### User Accounts
I then created user accounts using a standardized naming convention (e.g., first initial + last name) for easier identification and management. Each account was populated with:
- Username and display name- Department information
- Appropriate group memberships

For administrative accounts, I applied specific settings such as “Password never expires” (only where operationally justified) and enabled additional security controls.

### PowerShell Automation
To speed up provisioning and reduce human error, I used a PowerShell script to:
- Bulk-create multiple user accounts at once
- Assign the correct security group memberships
- Place each account into the right OU automatically

This automation not only mirrors real-world onboarding workflows but also demonstrates the importance of scripting in large-scale IT operations.

### Outcome
The result is an Active Directory environment that is:
- **Organized** with a clear and scalable OU hierarchy
- **Secure** through RBAC and adherence to the principle of least privilege
- **Efficient** thanks to automation-driven provisioning
- **Ready for growth**, making it easy to onboard new hires or restructure departments without disruption

### Skills Demonstrated
- Active Directory design and administration
- Group Policy Object (GPO) targeting
- Role-Based Access Control (RBAC) implementation
- User provisioning and lifecycle management
- PowerShell scripting for automation
- Enterprise security best practices

---

## 📸 Screenshots

Below are screenshots showing the OU structure, security groups, and user accounts as configured in this section.

**OU Structure**
![Screenshot of OU Structure](path/to/ou-structure.png)

**Security Groups**
![Screenshot of Security Groups](path/to/security-groups.png)

**User Accounts**
![Screenshot of User Accounts](path/to/user-accounts.png)

**PowerShell Automation Output**
![Screenshot of PowerShell Script Results](path/to/powershell-output.png)
