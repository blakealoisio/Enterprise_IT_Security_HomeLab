
# Project 001 — Windows Authentication Investigation Using KQL

## Overview

This project documents a controlled Windows authentication investigation conducted in my Active Directory homelab. The objective was to generate failed authentication activity, collect Windows Security events centrally using Azure Monitor, and investigate the activity using Kusto Query Language (KQL).

The investigation also demonstrated how incomplete endpoint telemetry can affect security monitoring and how to validate data collection across multiple systems.

## Lab Environment

| Component | Configuration |
|---|---|
| Domain Controller | Windows Server 2022 — DC01-Admin |
| Workstation | Windows 11 Pro — W11-PC01 |
| Active Directory | BlakeLab.local |
| Test Account | Standard domain user (Reception) |
| Monitoring | Azure Arc, Azure Monitor Agent, Log Analytics |
| Query Language | KQL |

## Investigation Scenario

A controlled authentication test was performed against a standard domain user account on W11-PC01.

Three incorrect passwords were entered, followed by an authentication attempt using the account's existing password. Windows required a password change because the password had expired.

Windows Security Event ID **4625** recorded the authentication failures.

## Investigation Findings

Four failed authentication events were identified in the workstation's local Windows Security log.

| Finding | Event ID | Status | SubStatus |
|---|---|---|---|
| Incorrect password | 4625 | `0xC000006D` | `0xC000006A` |
| Expired password | 4625 | `0xC000006E` | `0xC0000071` |

The events involved **Logon Type 2**, indicating interactive authentication.

### Telemetry Visibility Gap

Initially, only the domain controller's authentication events were available in Azure Log Analytics.

The workstation's events were recorded locally but were not visible in centralized monitoring.

To address this gap, I:

1. Onboarded W11-PC01 to Azure Arc.
2. Installed Azure Monitor Agent.
3. Associated the workstation with an existing Data Collection Rule.
4. Verified agent connectivity using KQL heartbeat queries.
5. Confirmed workstation authentication events were arriving in Log Analytics.

## KQL Investigation

KQL was used to identify failed authentication events and extract the target username from XML-based event data.

The investigation query is maintained in the `queries/` directory.

### Key Findings

- **Target account:** Chase
- **Source workstation:** W11-PC01
- **Authentication type:** Interactive logon (Type 2)
- **Failure:** Incorrect password
- **Source IP:** 127.0.0.1 (loopback) -- Performed directly on the W11-PC01 machine. Event did not identify a remote source IP.

The centralized KQL results confirmed a failed authentication event associated with Chase. The local Windows Security log provided additional evidence of the expired-password failure.

## Conclusion

The observed authentication failures were generated through authorized testing.

Three attempts used incorrect passwords, while an additional authentication failure resulted from an expired password.

The investigation demonstrated how to distinguish authentication failure causes, identify telemetry coverage gaps, and investigate security events using KQL.

## Lessons Learned

- Authentication failures may be recorded on the workstation rather than the domain controller.
- A connected monitoring agent does not guarantee that the expected security events are being ingested.
- Windows Security status and substatus codes provide important investigative context.
- KQL can extract useful fields from raw XML event data.
- Security findings should be supported by actual event evidence.

## Evidence and Queries

Supporting KQL queries and investigation screenshots will be added to the following directories:

- `queries/` — Saved KQL investigation queries
- `evidence/` — Screenshots of Windows Security events and Azure Log Analytics results

## Future Improvements

- Expand collection to include additional Kerberos and NTLM authentication events.
- Create Microsoft Sentinel analytics rules for suspicious authentication activity.
- Practice incident triage, investigation, and detection tuning.
