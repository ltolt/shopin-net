package base.framework.util;


/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2008-12-29
 * Time: 13:01:53
 * 格式化工具类
 */
public class FormatUtil {

	/**
	 * 格式化二进制。默认取8位，超过则截取，不足则补零。
	 * 格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 * @param binary
	 *            需要格式化的字节。
	 *
	 * @return 格式化后的字符串。
	 */
	public static String formatBinary(byte binary) {

		return formatBinary(binary, null).toString();

	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 *
	 *
	 * @param binary
	 *            需要格式化的字节。
	 * @param bitCount
	 *            需要格式化的位数。
	 *
	 * @return 格式化后的字符串。
	 */
	public static String formatBinary(byte binary, int bitCount) {

		return formatBinary(binary, null, bitCount).toString();

	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 *
	 * @param binary
	 *            需要格式化的字节。
	 * @param toAppendTo
	 *            追加到的Builder。
	 *
	 * @return 格式化后的StringBuilder。
	 */
	public static StringBuilder formatBinary(byte binary,
			StringBuilder toAppendTo) {

		return formatBinary(binary, toAppendTo, Codec.EIGHT_BIT);
	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 *
	 *
	 * @param binary
	 *            需要格式化的字节。
	 * @param toAppendTo
	 *            追加到的Builder。
	 * @param bitCount
	 *            需要格式化的位数。
	 *
	 * @return 格式化后的StringBuilder。
	 */
	public static StringBuilder formatBinary(byte binary,
			StringBuilder toAppendTo, int bitCount) {

		String strBinary = Integer.toBinaryString(binary);

		return formatBinary(strBinary, toAppendTo, bitCount);
	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 *
	 *
	 * @param binary
	 *            需要格式化的字节。
	 *
	 * @return 格式化后的字符串。
	 */
	public static String formatBinary(String binary) {

		return formatBinary(binary, null).toString();

	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 *
	 * @param binary
	 *            需要格式化的字节。
	 * @param bitCount
	 *            需要格式化的位数。
	 *
	 * @return 格式化后的字符串。
	 */
	public static String formatBinary(String binary, int bitCount) {

		return formatBinary(binary, null, bitCount).toString();

	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 *
	 * @param binary
	 *            需要格式化的字节。
	 * @param toAppendTo
	 *            追加到的Builder。
	 *
	 * @return 格式化后的StringBuilder。
	 */
	public static StringBuilder formatBinary(String binary,
			StringBuilder toAppendTo) {

		return formatBinary(binary, toAppendTo, Codec.EIGHT_BIT);

	}

	/**
	 * 格式化二进制，超过则截取，不足则补零。格式：“00000000”，与NumberFormat的pattern：“########”类似。
	 * 
	 * @param binary
	 *            需要格式化的字节。
	 * @param toAppendTo
	 *            追加到的Builder。
	 * @param bitCount
	 *            追加到的Builder。
	 *
	 * @return 格式化后的StringBuilder。
	 */
	public static StringBuilder formatBinary(String binary,
			StringBuilder toAppendTo, int bitCount) {

		if (binary == null || binary.length() < 1) {

			return toAppendTo;

		}

		if (toAppendTo == null) {

			toAppendTo = new StringBuilder();

		}

		if (binary.length() == bitCount) {

			toAppendTo.append(binary);

			return toAppendTo;

		}

		/*
		 * 前补0， 如： "100011" to "00100011"
		 */
		if (binary.length() < bitCount) {

			StringBuilder formatted = new StringBuilder();

			formatted.append(binary);

			do {

				formatted.insert(0, "0");

			} while (formatted.length() < bitCount);

			toAppendTo.append(formatted);

			return toAppendTo;

		}

		/*
		 * 截取， 如： "11111111111111111111111110100011" to "10100011"
		 */
		if (binary.length() > bitCount) {

			String intercepted = binary.substring(binary.length() - bitCount);

			toAppendTo.append(intercepted);

			return toAppendTo;

		}

		return toAppendTo;
	}

}

