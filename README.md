# chatGPTBash.sh
This tool leverages the OpenAI API to process data directly from the command line, supporting both pipeline input and command line arguments. It is designed to enhance the organization and explanation of information, presenting it in a clear, readable format suitable for integration into vulnerability reports, playbooks, and checklists. Additionally, it facilitates the posing of straightforward questions, making it a versatile asset for data analysis and report generation.
## Configuration
The variable $OKEY is designated for the OpenAI API key. Users may retain this default assignment or modify it as needed. Additionally, the script necessitates the installation of jq for JSON processing.
### Usage
```Bash
chmod +x ./chatGPTBash.sh
```
```Bash
nmap -sn 10.0.2.0/24 | ./chatGPTBash.sh
```
```Bash
./chatGPTBash.sh Give me a list of all genres of music > genres.txt
```
### Define systemContent and model
```
systemContent="You are a helpful assistant. Explain the data provided professionally. Regurgitate\
the data back in an organized format."
model="gpt-4o-mini"
```
### Install Requirements
```Bash
sudo apt install jq
```
### Link
(jq)[https://jqlang.github.io/jq/]