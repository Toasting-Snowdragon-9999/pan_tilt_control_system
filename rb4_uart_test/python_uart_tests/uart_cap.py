import time
import csv
import serial

def capture_uart16(com_port, baudrate, output_file, duration_s=10):
    # open serial port
    ser = serial.Serial(com_port, baudrate, timeout=0.5)
    print(f"Opened {com_port} at {baudrate} baud.")
    
    # drop any junk
    ser.reset_input_buffer()

    count = 0
    start_time = time.time()

    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        # header columns: sample index, high byte hex, low byte hex, numeric
        writer.writerow(['index', 'high_hex', 'low_hex', 'value'])

        # run for duration_s seconds
        while time.time() - start_time < duration_s:
            data = ser.read(2)
            if len(data) == 2:
                lo, hi = data[0], data[1]
                value = (hi << 8) | lo
                writer.writerow([
                    count,
                    f"0x{hi:02X}",
                    f"0x{lo:02X}",
                    value
                ])
                count += 1
            # if len(data) < 2: just try again

    ser.close()
    print(f"Captured {count} samples to '{output_file}'.")

if __name__ == '__main__':
    capture_uart16('COM5', 9600, 'rx_log.csv', duration_s=20)
