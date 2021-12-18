package com.tuana9a.entities;

public class Range {
    public long start;
    public long end;
    public long length;
    public long total;

    /**
     * Constructor
     *
     * @param start Start of byte-range
     * @param end   End of byte-range
     * @param total Total bytes of file
     */
    public Range(long start, long end, long total) {
        this.start = start;
        this.end = end;
        this.total = total;
        this.length = end - start + 1;
    }
}
