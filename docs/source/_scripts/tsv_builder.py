import os
import sys

if __name__=="__main__":
    with open('images.tsv', 'w') as out:
        for arg in sys.argv[1:]:
            for root, _, files in os.walk(arg):
                for fname in files:
                    basename, ext = os.path.splitext(fname)
                    if ext.lower() in ('.jpg', '.jpeg', '.png', '.webp'):
                        print("%s\t%s" % (os.path.join(root, fname), basename), file=out)


