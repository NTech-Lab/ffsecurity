import os
import sys


print('sys.argv = ', sys.argv[1])


def create_file(path):
    open("images.tsv", 'w').close()
    with open("images.tsv", "a") as f:
        for file in os.listdir(path):
            if not file.startswith('.') and file.endswith(('.jpg', '.png', '.jpeg')) \
                    and os.path.isfile(os.path.abspath(path) + '/' + file):
                            print('%s/%s \t %s' % (os.path.abspath(path), file, os.path.splitext(file)[0]))
                            f.writelines('%s/%s \t %s\n' % (os.path.abspath(path), file, os.path.splitext(file)[0]))


path = sys.argv[1]
create_file(path)
