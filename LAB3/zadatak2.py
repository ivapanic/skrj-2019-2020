import sys


def check_input(num):
    if num != 2:
        print("Invalid number of arguments, enter filepath")
        exit(1)


def handle_IO(input_file):
    try:
        FILE = open(input_file, 'r')
    except IOError as ex:
        print("ERROR: File cannot be opened")
        sys.exit(1)
    return FILE


def append_to_list(line):
    numbers = list([float(a) for a in line.strip().split(" ")])
    return numbers


def hyp_output(start, list=None, counter=0):
    if start:
        print("Hyp", end="")
        for i in range(10, 100, 10):
            print("#Q{0}".format(i), end="")
        print()
    else:
        num = "%03d" %counter
        print(num, end="")
        for element in list:
            print("#" + str(element), end="")
        print()


def calculate_HD(list):
    result = []

    for Q in range(1, 10, 1):
        result.append(list[int((Q / 10) * len(list))])

    return result


def main():
    check_input(len(sys.argv))
    file = handle_IO(sys.argv[1])

    hyp_output(True)
    counter = 1
    for line in file:
        numbers = append_to_list(line)
        numbers.sort()
        result = calculate_HD(numbers)
        hyp_output(False, result, counter)
        counter += 1


if __name__ == '__main__':
    main()
