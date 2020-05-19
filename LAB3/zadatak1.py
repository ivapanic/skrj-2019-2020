import sys


class Matrix(object):

    def __init__(self, arg1, arg2, second=False):
        self.index = 0
        self.matrix_dict = {}

        if type(arg1) == str:
            file = open(arg1, 'r')

            for line in file:
                if line != '\n' or second:
                    if self.index >= arg2:
                        if self.index == arg2:
                            self.matrix_dict['n_rows'] = line.strip().split(' ')[0]
                            self.matrix_dict['n_columns'] = line.strip().split(' ')[1]
                        else:
                            line_split = line.strip().split(" ")
                            if len(line_split) != 3:
                                print("Invalid number of elements in line")
                                sys.exit(1)
                            else:
                                row, column, element = int(line_split[0]), int(line_split[1]), float(line_split[2])
                                self.matrix_dict[(row, column)] = element
                    self.index += 1

                else:
                    return

        elif type(arg1) == int:
            self.matrix_dict['n_rows'] = arg1
            self.matrix_dict['n_columns'] = arg2

    def calc_element(self, x, y, other):
        sum_of_elements = 0

        for i in range(1, int(self.matrix_dict['n_columns']) + 1):
            first = 0
            second = 0
            if (x, i) in self.matrix_dict:
                first = self.matrix_dict[(x, i)]
            if (i, y) in other.matrix_dict:
                second = other.matrix_dict[(i, y)]

            sum_of_elements += first * second

        return sum_of_elements

    def __mul__(self, other):
        if self.matrix_dict['n_columns'] != other.matrix_dict['n_rows']:
            print("Invalid dimensions. Number of columns of the first matrix must be equal to number"
                  "of columns of the second matrix")
            exit(1)

        else:
            C = Matrix(int(other.matrix_dict['n_rows']), int(self.matrix_dict['n_columns']))

            for x in range(1, int(self.matrix_dict['n_columns']) + 1):
                for y in range(1, int(other.matrix_dict['n_rows']) + 1):
                    if self.calc_element(x, y, other) != 0:
                        C.matrix_dict[(x, y)] = self.calc_element(x, y, other)

            return C

    def print(self, filename=sys.stdout):
        if filename != sys.stdout:
            print(str(self.matrix_dict['n_rows']) + " " + str(self.matrix_dict['n_columns']), file=filename)
            for i in self.matrix_dict:
                if isinstance(i, tuple):
                    print(str(i[0]) + " " + str(i[1]) + " " + str(self.matrix_dict[i]), file=filename)
        else:
            for i in range(1, int(self.matrix_dict['n_columns']) + 1):
                for j in range(1, int(self.matrix_dict['n_rows']) + 1):
                    if (i, j) in self.matrix_dict:
                        value = "%2.2f" % self.matrix_dict[(i, j)]
                    else:
                        value = "%2.2f" % 0
                    print(value, end=" ") if j != self.matrix_dict['n_rows'] else print(value)


def parse_input(file_input):
    index = 0
    A = Matrix(file_input, index)
    for line in open(file_input, 'r'):
        if line == '\n':
            B = Matrix(file_input, index + 1, True)
        index += 1

    return A, B


def check_len_argv(num):
    if num != 3:
        print("Invalid number of arguments, enter paths to input and output files")
        sys.exit(1)


def main():
    check_len_argv(len(sys.argv))
    file_input = sys.argv[1]
    file_output = sys.argv[2]
    parse_input(file_input)
    A, B = parse_input(file_input)
    C = A * B
    C.print()
    C.print(open(file_output, 'w'))


if __name__ == '__main__':
    main()
