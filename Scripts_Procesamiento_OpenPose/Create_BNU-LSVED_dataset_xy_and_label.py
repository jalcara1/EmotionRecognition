#!/usr/bin/python

import sys
import os
import xml.etree.ElementTree as xml_parser
import string
import subprocess
data_dir = sys.argv[1] # xml root location
output = sys.argv[2] # txt output location of 70 pair points
output_label = sys.argv[3] # txt output location of label of 70 pair points

if len(sys.argv) > 4:
    output_format = sys.argv[4] # data format, printf like sintax
else:
    output_format = ",%d,%d"

output_file = open(output, "w")
output_file_label = open(output_label, "w")


for directory in sorted(os.listdir(data_dir)):
    data_subdir = "%s/%s" % (data_dir, directory)

    for subdirectory in sorted(os.listdir(data_subdir)):
        xml_dir = "%s/%s/%s" % (data_dir, directory, subdirectory)
        for xml_file in sorted(os.listdir(xml_dir)):

            if xml_file.endswith("face.xml"):
                xml = "%s/%s/%s/%s" % (data_dir, directory, subdirectory, xml_file)
                xml_tree = xml_parser.parse(xml)
                root = xml_tree.getroot()
                raw_data = root[0][2].text

                string_data = raw_data.split()[-210:] # take the last 70 points

                if string_data[0] == 'u':
                    print "U found in frame:", xml
                    continue

                data = list(map(float, string_data))
                points = [ data[i:i+3] for i in range(0, len(data), 3) ]
                #print points
                #print "\n\n"
                image_path = "%s/%s/%s" % (directory, subdirectory, xml_file.replace("_face.xml",""))
                #output_file.write(image_path)
                #print image_path
                for x,y,acc in points:
                    val = output_format % (x,y)
                    output_file.write(val)
                output_file.write("\n")

                if directory == "concentrated":
                    output_file_label.write("1\n")
                elif directory == "disgust":
                    output_file_label.write("2\n")
                elif directory == "distracted":
                    output_file_label.write("3\n")
                elif directory == "happy":
                    output_file_label.write("4\n")
                elif directory == "puzzle":
                    output_file_label.write("5\n")
                elif directory == "surprise":
                    output_file_label.write("6\n")
                elif directory == "tired":
                    output_file_label.write("7\n")
    #print(directory)

output_file.close()
output_file_label.close()
