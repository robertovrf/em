from tabulate import tabulate
import json

list = []
file = open("NewResults.data", "r") 
for line in file:
	if line != "\n":
		j = json.loads(line)
		newRow = []
		newRow.append(j['metrics'][0]['source'])
		newRow.append(j['metrics'][0]['value'])
		newRow.append(j['metrics'][0]['count'])
		newRow.append(j['metrics'][0]['value']/j['metrics'][0]['count'])
		list.append(newRow)
print(tabulate(list, headers=['Source', 'Value', 'Count', 'Avg (ms)']))
