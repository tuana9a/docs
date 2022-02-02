package com.tuana9a.learn.thread;

public class MyThread {
	// có thể tạo một thread bằng 2 cách
	// extend từ java.lang.Thread
	public static class ExtendsThread extends Thread {
		@Override
		public void run() {
			// làm gì đó
		}
	}

	public static class ImplementsRunnable implements Runnable {
		@Override
		public void run() {
			// làm gì đó
		}
	}

	// hoặc implements từ Runnable
	// và muốn làm gì trong thread thì viết trong run()

	public static void main(String[] args) throws Exception {
		// <b>với extend thì có thể chạy được ngay bằng start()</b>
		// <b>với implements thì phải truyền nó vào constructor của Thread</b>

		Thread t = new Thread(
				new Runnable() {
					@Override
					public void run() {
						// do somthing
					}
				});
		t.run(); // là hàm bình thường,
		t.start(); // mới là luồng thực sự

		int milliseconds = 1000;
		Thread.sleep(milliseconds); /*
									 * là hàm static không phải method
									 * là busy-waiting vì phải check thời gian liên tục
									 * làm thread sở hữu đoạn code này sẽ "ngủ đông" trong milliseconds
									 */

		t.join(milliseconds); /*
								 * làm thread khác phải chờ cho tới khi nó kết thúc
								 * bỏ qua tham số truyền vào sẽ ưu tiên cho tới chi thread chết
								 * còn lại sẽ chỉ cho thread đó ưu tiên trong dúng số milliseconds rồi ưu tiên
								 * bằng nhau
								 */
		int piority = 1;
		t.setPriority(piority);/*
								 * set thứ tự ưu tiên cho thread để mình có thể kiểm soát được thread
								 * dù ưu tiên cao hơn nhưng thread là độc lập và song song, nên ưu tiên bị
								 * ignored
								 */

		boolean isDeamon = true;
		t.setDaemon(isDeamon); /*
								 * set thread thành background thread, thread chạy ngầm
								 * mặc định là false tức là thread bình thường
								 */

	}
}
