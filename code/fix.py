import os 
for name in [name for name in os.listdir(os.getcwd()) if name.endswith(".asm")]:
    with open(name, "r") as f:
        asm = f.read() 
     
        
    if chr(9) not in asm: continue 
    out = ""
    while chr(9) in asm: 
        out += asm[:asm.index(chr(9))]
        out += "    " 
        asm = asm[asm.index(chr(9))+1:]
    out += asm 
    ""

    with open(name, "w") as f:
        f.write(out)
        
    with open(name, "r") as f:
        cleaned_lines = [line.lstrip(" ") for line in f if not line.startswith(";")]
        cleaned_lines = [f"             {line}" for line in cleaned_lines]
        for i, line in enumerate(cleaned_lines):
            if ":" in line: 
                cleaned_lines[i] = line.lstrip(" ")
        
        
    with open(name, "w") as f:
        f.write(("").join(cleaned_lines))
