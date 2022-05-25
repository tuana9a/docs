# tổng quan về lucene

tổng quan thì lucene là một lib để xử lý tìm kiếm text <br />
lucene đã được phát triển và hỗ trợ text index, <br />
ngoài ra có hỗ trợ nhiều loại index cho các cách search khác nhau <br />
các thành phần chính trong code của lucene

-   index writer có nhiệm vụ ghi index (chính)
-   directory là một abstract lưu index, index writer sẽ ghi index vào directory
-   directory lưu index thành các sub-indexs, tạo thành segments
-   một term là một cặp: field_name + token (token có thể là từ)
-   lucene tổ chức lưu trữ term cho việc tìm kiếm

# các concepts

xem [tại đây](./lucene-concepts.md)


# file format

xem [tại đây](https://lucene.apache.org/core/7_1_0/core/org/apache/lucene/codecs/lucene70/package-summary.html)

# lucene in a nutshell

link gốc từ stack over flow [https://stackoverflow.com/questions/2602253/how-does-lucene-index-documents](https://stackoverflow.com/questions/2602253/how-does-lucene-index-documents)

lucene lưu dạng [Skip list](https://en.wikipedia.org/wiki/Skip_list) (multi level) <br />
xuống disk và load chúng lên vào ram, click vào link để hiểu kĩ hơn về cái này <br />
sau đó lucene load vào bộ nhớ và sử dụng FST, xem thêm [tại đây](https://blog.mikemccandless.com/2010/12/using-finite-state-transducers-in.html)

## document
là một đơn vị lưu trữ trong lucene, một document sẽ gồm các trường <br />
khi thêm một trường thì toàn bộ nội dung của trường đó (full text) sẽ được tokenize <br />
với analyzer, có thể là bằng khoảng cách, có thể xem thêm [tại đây](https://lucene.apache.org/core/7_7_3/memory/index.html)

tìm hiểu tiếp về analyzer [tại đây](https://lucene.apache.org/core/7_7_3/analyzers-common/index.html)

tìm hiểu tiếp về query [tại đây](https://lucene.apache.org/core/7_7_3/queries/index.html)

# Refs


- [x] [https://stackoverflow.com/questions/2602253/how-does-lucene-index-documents](https://stackoverflow.com/questions/2602253/how-does-lucene-index-documents)
- [ ] [https://blog.mikemccandless.com/2010/12/using-finite-state-transducers-in.html](https://blog.mikemccandless.com/2010/12/using-finite-state-transducers-in.html)
- [ ] [https://lucene.apache.org/core/7_7_3/queryparser/index.html](https://lucene.apache.org/core/7_7_3/queryparser/index.html)
- [ ] [https://lucene.apache.org/core/7_7_3/analyzers-opennlp/index.html](https://lucene.apache.org/core/7_7_3/analyzers-opennlp/index.html)
- [ ] [https://lucene.apache.org/core/7_7_3/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package.description](https://lucene.apache.org/core/7_7_3/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package.description)
- [ ] [https://lucene.apache.org/core/7_7_3/core/org/apache/lucene/search/similarities/TFIDFSimilarity.html](https://lucene.apache.org/core/7_7_3/core/org/apache/lucene/search/similarities/TFIDFSimilarity.html)
- [ ] [https://lucene.apache.org/core/7_7_3/core/org/apache/lucene/search/package-summary.html#package.description](https://lucene.apache.org/core/7_7_3/core/org/apache/lucene/search/package-summary.html#package.description)
- [ ] [https://lucene.apache.org/core/7_7_3/analyzers-common/index.html](https://lucene.apache.org/core/7_7_3/analyzers-common/index.html)
- [ ] [http://www.lucenetutorial.com/basic-concepts.html](http://www.lucenetutorial.com/basic-concepts.html)
