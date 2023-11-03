
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Input/Output error and File Corruption on Linux Systems
---

This incident type relates to encountering input/output errors and file corruption on Linux systems. These errors can lead to boot issues for users and require troubleshooting to locate and unmount the affected device. The issue can be resolved using fsck, which automatically fixes errors.

### Parameters
```shell
export DEVICE="PLACEHOLDER"

export PATH_TO_LOG_FILE="PLACEHOLDER"
```

## Debug

### Check for file system errors
```shell
sudo fsck /dev/${DEVICE}
```

### Check disk usage and available space
```shell
df -h
```

### Check system logs for errors
```shell
dmesg | grep -i error
```

### Check file system mount points
```shell
mount | grep "${DEVICE}"
```

### Unmount a file system
```shell
sudo umount /dev/${DEVICE}
```

### Check file system type
```shell
sudo file -s /dev/${DEVICE}
```

### Check file system journal
```shell
sudo journalctl -k -b | grep -i "error"
```

### Check for bad blocks on a device
```shell
sudo badblocks -v /dev/${DEVICE}
```

### Check system logs and identify the root cause of the input/output error and file corruption.
```shell


#!/bin/bash



# Define log file path

LOG_FILE=${PATH_TO_LOG_FILE}



# Check log file for input/output errors and file corruption

grep -i "input/output error" $LOG_FILE

grep -i "file corruption" $LOG_FILE



# If issues are found, troubleshoot accordingly

if [ $? -eq 0 ]; then

    echo "Issues found in log file. Troubleshoot accordingly."

    # Add steps for troubleshooting here

else

    echo "No issues found in log file."

fi


```

### Repair file system errors automatically
```shell
sudo fsck -y /dev/${DEVICE}
```