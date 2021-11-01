package utility;

import java.util.Random;

public final class Methods {
	public static String GetRandomString(int length) {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(3);
			long result = 0;
			switch (number) {
				case 0:
					result = Math.round(Math.random() * 25 + 65);
					sb.append((char) result);
					break;
				case 1:
					result = Math.round(Math.random() * 25 + 97);
					sb.append((char) result);
					break;
				case 2:
					sb.append(new Random().nextInt(10));
					break;
			}
		}
		return sb.toString();
	}
	
	public static String GenerateRandomNumber(int length) {
		StringBuilder s = new StringBuilder();
		for (int i = 0; i < length; i++) {
			s.append(new Random().nextInt(10));
		}
		return s.toString();
	}
	
}
