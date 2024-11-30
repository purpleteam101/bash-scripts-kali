
# Bash Scripting Essentials

## Shebang:
The `#!/bin/bash` line specifies the script interpreter, instructing the system to use Bash to execute the script.

## Comments:
Begin comments with `#`. Comments serve to document the script and describe the functionality of different sections for maintainability.

## Variables:
Variables are defined using `=` and accessed using the `$` prefix. They are fundamental for dynamic scripting.  
Example:
```bash
TARGET="example.com"
```

## User Input:
The `read` command is utilized to accept user input during runtime.  
Example:
```bash
read -p "Enter target: " TARGET
```

## Conditionals:
Conditional statements enable decision-making and branching within scripts. Use `if`, `elif`, and `else` for comprehensive logic.  
Example:
```bash
if [ -z "$TARGET" ]; then
  echo "No target provided."
fi
```

## Loops:
Loops are frequently used to iterate over elements or perform repetitive tasks. While not present in the example, they are a core scripting tool.  
Example:
```bash
for file in *.txt; do
  echo $file
done
```

## Commands:
External commands can be executed directly, with their output captured using the `$(...)` syntax.  
Example:
```bash
OPEN_PORTS=$(nmap -p- --open "$TARGET" | grep open)
```

## Logging:
Output redirection allows the storage of data into files. Use `>` to overwrite and `>>` to append.  
Example:
```bash
echo "Open ports: $OPEN_PORTS" > log.txt
```

## Exiting:
The `exit` command terminates the script and returns a status code, which can be used to indicate success or error conditions.  
Example:
```bash
exit 1
```
