package com.tuana9a.learn.thread;

// đồng bộ các thread
public class SyncThread {
    /**
     * synchronized method
     * hai thread chạy method của cùng object dẫn tới không nhất quán dữ liệu
     * synchronized method đảm bảo chỉ 1 thread truy cập tại 1 thời điểm, thread
     * khác phải chờ
     * chỉ khóa synchronized method, object sử dụng bình thường (các method khác,
     * thuộc tính)
     */
    synchronized public void syncMethod() {
        // do something
    }

    /**
     * cũng giống như synchronized method nhưng cần Monitor, lock object
     * object này vẫn sử dụng bình thường (method,thuộc tính) không bị lock hay sync
     * tuy nhiên object này trong thực tế nên là final, const
     * vì nếu thay đổi object thì các thread khác sẽ vào được sync block
     */
    public void syncBlock(Object lock) {
        synchronized (lock) {
            // do something
            // chỉ dùng trong synchronized block
            try {
                lock.wait();
                // pause execution until got .notify() or .notfifyAll()
                // <strong>.wait() đồng thời giải phóng object lock để các luồng khác có thể vào
                // block</strong>
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            lock.notify(); // notify lastest .wait() block execution
            lock.notifyAll(); // notify all .wait() block execution
        }
    }

    public static void main(String[] args) {
        // DeadLockException
        /**
         * sảy ra khi thread này chờ thread kia và ngược lại, chương trình chờ mãi
         * 
         * mãi (hoặc Exception xảy ra)
         * hoặc wait mà không có notify, khi đó chương trình chờ mãi mãi
         */
        /**
         * VD: có 2 synchronized method (m1, m2), method này gọi method kia trong body
         * method
         * 
         * giả sử có 2 thread t1 gọi m1, t2 gọi m2
         * khi đó t1 đợi t2 dùng xong m2 và t2 dợi t1 dùng xong m1
         * vậy là DeadLock sảy ra
         */
    }

}
