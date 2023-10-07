def compress_rle(data):
    compressed_data = []
    count = 1
    for i in range(1, len(data)):
        if data[i] == data[i - 1]:
            count += 1
        else:
            compressed_data.append(count)
            compressed_data.append(data[i - 1])
            count = 1
    compressed_data.append(count)
    compressed_data.append(data[-1])
    return compressed_data

# Read binary data from "export.bin"
with open("export.bin", "rb") as f:
    source = f.read()

# Convert binary data to hexadecimal representation
hex_data = [hex(byte)[2:].zfill(2) for byte in source]

# Compress the hexadecimal data using RLE
compressed_data = compress_rle(hex_data)

# Create the payload string
payload = ".db "
for i in range(0, len(compressed_data), 2):
    count = compressed_data[i]
    byte = compressed_data[i + 1]
    payload += f"${count}, ${byte}, "

# Write payload to "export.asm"
with open("export.asm", "w") as f:
    f.write(payload[:-2])