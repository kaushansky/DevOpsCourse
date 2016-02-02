import sys
import os
import getopt


def main(argv):
        warfile = ''
        myserver = ''
        targetdir = ''
        mycommand = ''
        try:
                opts, args = getopt.getopt(argv,"hw:t:s:",["wfile=","tdir=","srv="])
        except getopt.GetoptError:
                print 'getwar.py -w <warfile> -t <targetdir> -s <server>'
                sys.exit(2)
        for opt, arg in opts:
                if opt == '-h':
                        print 'getwar.py -w <warfile> -t <targetdir> -s <server>'
                        sys.exit()
                elif opt in ("-w", "--wfile"):
                        warfile = arg
                elif opt in ("-t", "--tdir"):
                        targetdir = arg
                elif opt in ("-s","--srv"):
                        myserver = arg
        print 'War file is "', warfile
        print 'Target dir is "', targetdir
        print 'Server name is "', myserver
        mycommand = 'sshpass -p \'duv_admin\' scp root@' + myserver + ':' + warfile + ' ' + targetdir
        print 'Executing command: ' + mycommand
        os.system(mycommand)
#       os.system("sshpass -p r'3.14zdec' scp root@build-node-01:/etc/jenkins/build-node-01/workspace/buildtest/target/courseProject.war /var/lib/tomcat/webapps/courseProject.war")
if __name__ == "__main__":
   main(sys.argv[1:])
