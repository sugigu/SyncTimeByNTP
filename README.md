# Random NTP Sync for Windows

A simple PowerShell script that randomly selects one public NTP server, configures Windows Time Service (`w32time`) to use it, and immediately synchronizes the system clock.

This script is intended to run automatically at system startup or user logon via Windows Task Scheduler.

## Features

* Randomly selects one of the following public NTP servers:

  * `time.stdtime.gov.tw` (Taiwan National Standard Time)
  * `time.google.com`
  * `time.cloudflare.com`
* Starts the Windows Time service if necessary.
* Updates the configured NTP server.
* Forces an immediate time synchronization.
* Displays the current synchronization status.

## Why Random Selection?

Measuring the "fastest" NTP server sounds nice in theory, but many public NTP servers either:

* Block ICMP (ping)
* Ignore custom UDP NTP probes
* Behave differently depending on network conditions

In practice, randomly selecting from several reliable public servers provides a simple and dependable solution without adding unnecessary complexity.

## Requirements

* Windows 10 / Windows 11
* PowerShell 5.1 or PowerShell 7
* Administrator privileges

## Usage

Run the script as Administrator:

```powershell
.\RandomNtpAndSync.ps1
```

Or configure it to run automatically using Windows Task Scheduler.

Recommended settings:

* Trigger: At startup or At logon
* Run with highest privileges

## Example Output

```text
Selected NTP: time.cloudflare.com

The command completed successfully.

Sending resync command to local computer...
The command completed successfully.

Source: time.cloudflare.com,0x8
Last Successful Sync Time: 2026-06-25 20:38:42
```

## License

MIT License
