import re
import sys
import urllib.request


def get_website(args):
    if len(args) != 2:
        print("Enter address of the website")
        exit(1)

    website = urllib.request.urlopen(args[1])
    return website


def find(mystr):
    urls = re.findall(r'href="http.*?"', mystr)
    hosts = {}

    print("\n%23s\n" % "----URLs----")

    for url in set(urls):
        host = re.search(r'"http.*://((www.)?(.*?)(/.*)?)"', url).group(3)
        if host in hosts:
            hosts[host] += 1
        else:
            hosts[host] = 1
        url = re.search(r'"http.*://((www.)?(.*)?)"', url).group(1)
        line = '%-20s' % url
        print(line)

    print("\n%23s\n" % "----HOSTS----")
    header = '%-20s' % "HOST" + '%-20s' % "NUMBER OF REFERENCES"
    print(header)

    for host in hosts:
        line = '%-20s' % host + '%10d' % hosts[host]
        print(line)

    mails = re.findall(r'([a-z0-9_.]+@[a-z0-9]+\.[a-z0-9.]+)', mystr)

    print("\n%23s\n" % "----MAILS----")

    for mail in mails:
        line = '%-20s' % mail
        print(line)

    pics = re.findall(r"<img class=", mystr)
    print("\n%23s\n" % "----PICTURES----")
    header = '%-20s' % "NUMBER OF REFERENCES"
    print(header)
    print("%-20s" % len(pics))


def main():
    website = get_website(sys.argv)
    mybites = website.read()
    mystr = mybites.decode("utf8")
    print(mystr)
    find(mystr)


if __name__ == '__main__':
    main()
