import ssl
import socket
import argparse

def parse_arguments():
    parser = argparse.ArgumentParser(description="Verify the validity of the SSL certificate for a website.")
    parser.add_argument('hostname', metavar='HOSTNAME', help='The hostname of the website (e.g., www.example.com)')

    return parser.parse_args()

def verify_ssl_certificate(hostname):
    try:
        context = ssl.create_default_context()
        with socket.create_connection((hostname, 443)) as sock:
            with context.wrap_socket(sock, server_hostname=hostname) as ssock:
                print(f"SSL certificate for {hostname} is valid.")
    except ssl.SSLCertVerificationError as e:
        print(f"SSL certificate for {hostname} is not valid: {e}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    args = parse_arguments()
    website_hostname = args.hostname
    verify_ssl_certificate(website_hostname)
