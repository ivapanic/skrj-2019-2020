import os

students = {}


def check_files(directory):
    files = os.listdir(directory)
    if len(files) > 0:
        if files.__contains__('studenti.txt'):
            for line in open('./studenti.txt', 'r'):
                jmbag = line.strip().split(" ")[0]
                last_name = line.strip().split(" ")[1]
                first_name = line.strip().split(" ")[2]
                students[(jmbag, last_name, first_name)] = []
        else:
            print("File studenti.txt not found")
            exit(1)


def lab_exercises(directory):
    files = os.listdir(directory)
    os.chdir(directory)
    labs = []

    if len(files) > 0:
        labs = [filename for filename in files if 'Lab' in filename]
        labs.sort()
        for lab in labs:
            file = open(lab, 'r')
            lab_name = lab.split("_")[0]
            for line in file:
                jmbag = line.strip().split(" ")[0]
                points = float(line.strip().split(" ")[1])

                for key in students:
                    if key[0] == jmbag:
                        if len(students[key]) == 0:
                            list = [(lab_name, points)]
                            students[key] = list
                        else:
                            if len([l for l in students[key] if lab_name in l]) > 0:
                                print("Student " + key[1] + " " + key[2] + " can't attend the same lab exercise more than once")
                                print("Lab: " + lab_name)
                                exit(1)
                            else:
                                students[key].append((lab_name, points))
    output(labs)


def output(labs):
    header = "%-20s %-20s" % ("JMBAG", "Prezime, Ime")

    labs = sorted(set([lab.split("_")[0].split("ab")[0] + lab.split("_")[0].split("ab")[1] for lab in labs]))

    for lab in labs:
        header += "%-10s" % lab


    print(header)
    for key in students:
        for element in students[key]:
            student_line = "%-20s %-20s" % (key[0], key[1] + key[2])
            for line in sorted(students[key]):
                name = str(line[0].split("ab")[0] + line[0].split("ab")[1])
                for lab in labs:
                    if lab == name:
                        student_line += "%-10s" % line[1]

        print(student_line)

def main():
    check_files(".")
    lab_exercises(".")


if __name__ == '__main__':
    main()
