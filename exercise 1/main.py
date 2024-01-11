import csv
import ast

# Split keywords_source.csv to two files

movie_keywords_header = ['movie_id', 'keyword_id']
keywords_header = ['id', 'name']

with open("keywords_source.csv") as fp, open("movie_keywords.csv", "w+") as fp_out_1, open("keywords.csv", "w+") as fp_out_2:
    # Write headers to destination to both files
    csv_writer_1 = csv.writer(fp_out_1, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    csv_writer_1.writerow(movie_keywords_header)

    csv_writer_2 = csv.writer(fp_out_2, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    csv_writer_2.writerow(keywords_header)

    # skip source header
    csv_reader = csv.reader(fp)
    header = next(csv_reader)

    ids = set()

    for row in csv_reader:
        movie_id = row[0];
        keywords_json = row[1];

        keyword_list = ast.literal_eval(keywords_json)

        if len(keyword_list) == 0:
            continue

        for keyword in keyword_list:
            csv_writer_1.writerow([movie_id, keyword['id']])
            id = keyword['id']
            name = keyword['name']

            if not id in ids:
                csv_writer_2.writerow([id, name])
                ids.add(id)


 