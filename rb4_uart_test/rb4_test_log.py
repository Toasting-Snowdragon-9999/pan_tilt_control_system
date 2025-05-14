#!/usr/bin/env python3
import serial
import argparse
import sys

def main():
    p = argparse.ArgumentParser(description="Log everything received over UART to a text file")
    p.add_argument("--port",   "-p", default="COM5",     help="Serial port (e.g. COM5 or /dev/ttyUSB0)")
    p.add_argument("--baud",   "-b", type=int, default=115200, help="Baud rate")
    p.add_argument("--outfile","-o", default="uart_log.txt", help="Output text file")
    args = p.parse_args()

    try:
        ser = serial.Serial(args.port, args.baud, timeout=1)
    except serial.SerialException as e:
        sys.exit(f"Error opening {args.port}: {e}")

    print(f"Logging {args.port} @ {args.baud} baud → {args.outfile}")
    with ser, open(args.outfile, "w", newline="") as f:
        try:
            while True:
                # read one line (up to and including '\n')
                data = ser.readline()
                if not data:
                    continue
                # decode to text (replace any invalid bytes)
                text = data.decode("utf-8", errors="replace")
                f.write(text)
                f.flush()
        except KeyboardInterrupt:
            print("\nInterrupted by user. Exiting.")

if __name__ == "__main__":
    main()
