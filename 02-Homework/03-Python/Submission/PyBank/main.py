import csv

csvpath = "GITLAB/untitled folder/SMU-VIRT-DATA-PT-09-2022-U-LOLC/02-Homework/03-Python/Instructions/PyBank/Resources/budget_data.csv"

rows = 0
total = 0

last_profit = 0
total_changes = 0
num_changes = 0
max_change = -999999999
min_change = 999999999
min_month = ""
max_month = ""

with open(csvpath, encoding='utf-8') as csvfile:

    csvreader = csv.reader(csvfile, delimiter=',')

    csv_header = next(csvreader)
    print(f"CSV Header: {csv_header}")

    for row in csvreader:
        rows+=1
        total += int(row[1])

        if rows != 1:
            change = int(row[1]) - last_profit
            total_changes += change
            num_changes += 1

            if (change > max_change):
                max_change = change
                max_month = row[0]
            elif (change <min_change):
                min_change = change
                min_month = row[0]
            else:
                pass
            

        last_profit = int(row[1])


print(rows)
print(total)
print(num_changes)
print(total_changes / num_changes)
print(f"Max Change: {max_month}: {max_change}")
print(f"Min Change: {min_month}: {min_change}")

output = f"""Financial Analysis
----------------------------
Total Months: {rows}
Total: ${total}
Average Change: ${round(total_changes / num_changes, 2)}
Greatest Increase in Profits: {max_month} (${max_change})
Greatest Decrease in Profits: {min_month} (${min_change})"""

print(output)

with open('pybank_hw_flores.txt', 'w') as f:
    f.write(output)