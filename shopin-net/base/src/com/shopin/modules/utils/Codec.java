package com.shopin.modules.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 字符串的(编码/加密)与(解码/解密)。
 */
public class Codec {

	
	public static void main(String[] args) {
		String str = Codec.encodeMd5("net.shopin.service.ProductServiceImpl.getProduct.9097981");
		System.out.println(str);
		
	}
	 
	/**
	 * 码表
	 */                                        
	private final static String CODEC_TABLE = "$0b1c2d3f4g5h6i7j8k9lmnoqrsuvwxz";

	/**
	 * 表示5bit的字节
	 */
	public final static int FIVE_BIT = 5;

	/**
	 * 表示8bit的字节
	 */
	public final static int EIGHT_BIT = 8;

	/**
	 * 表示二进制
	 */
	public final static int BINARY = 2;

	/**
	 * (编码/加密)字符串，采用默认语言环境的 character set。
	 *
	 * @param keys
	 *            需要(编码/加密)的字符串
	 *
	 * @return (编码/加密)后的字符串
	 */
	public static String encode(String keys) {

		return encode(keys, null);

	}

	/**
	 * (编码/加密)字符串
	 *
	 *
	 * @param keys
	 *            需要(编码/加密)的字符串
	 * @param characterSet
	 *            字符集
	 *
	 * @return (编码/加密)后的字符串
	 */
	public static String encode(String keys, String characterSet) {

		if (keys == null || "".equals(keys)) {
			return "";
		}

		byte[] keyBytes = null;

		if (characterSet == null || characterSet.length() < 1) {

			// 采用默认语言环境的 character set。
			keyBytes = keys.getBytes();

		} else {

			try {

				// 采用指定的 character set。
				keyBytes = keys.getBytes(characterSet);

			} catch (UnsupportedEncodingException e) {
				// ignore...
			}

		}
		return encode(keyBytes);
	}

	/**
	 * (编码/加密)字节数组
	 *
	 *
	 * @param keyBytes
	 *            需要(编码/加密)的字节数组
	 *
	 * @return (编码/加密)后的字符串
	 */
	private static String encode(byte[] keyBytes) {

		if (keyBytes == null || keyBytes.length < 1) {

			return "";

		}

		/*
		 * 合并二进制码，
		 * 如：
		 *     00101010 11010011 00101101 10100011
		 *   to
		 *     00101010110100110010110110100011
		 */

		StringBuilder mergrd = new StringBuilder();

        for (byte keyByte : keyBytes) {

            FormatUtil.formatBinary(keyByte, mergrd);

        }

		/*
		 * 以5个bit为单位，计算能分多少组，
		 * 如：
         *     00101010110100110010110110100011
		 *   to
		 *     00101 01011 01001 10010 11011 01000 11
		 *                                          |
		 *                                   （这个11为余下的位）
		 */

		int groupCount = mergrd.length() / FIVE_BIT;

		// 计算余下的位数
		int lastCount = mergrd.length() % FIVE_BIT;

		// 类似数据分页的算法，有余数的情况下需要加 1。
		if (lastCount > 0) {

			groupCount += 1;

		}

		/*
		 * (编码/加密)
		 */

		StringBuilder sbEncoded = new StringBuilder();

		// 循环所需的条件
		int forMax = groupCount * FIVE_BIT;

		// 每次递增5位来截取
		for (int i = 0; i < forMax; i += FIVE_BIT) {

			// 结束点
			int end = i + FIVE_BIT;

			/*
			 * 如果结束点比已合并的二进制码串的长度要大，
			 * 相当于有余数，
             * 并且表示当前循环到了（已合并的二进制码串的长度 % FIVE_BIT）的那一截。
			 */

			// 标记是否到了余数的那一截
			boolean flag = false;

			if (end > mergrd.length()) {

				/*
				 * 如果结束点比已合并的二进制码串的长度要大，
				 * 结束点需要被重设为：
				 * 已合并的二进制码串的长度，等价于（i + lastCount). 并且重设标记。
				 */

				end = (i + lastCount);

				flag = true;

			}

			// 截取
			String strFiveBit = mergrd.substring(i, end);

			// 截取后从二进制转为十进制
			int intFiveBit = Integer.parseInt(strFiveBit, BINARY);

			if (flag) {

				/*
				 * 如果结束点比已合并的二进制码串的长度要大，
				 * 或者是到了余数的那一截：
				 * 需要左移操作，假设余下的二进制位为：11，
				 * 那么需要从后面补0，左移操作后为 (000)11(000)
				 */

				intFiveBit <<= (FIVE_BIT - lastCount);

			}

			// 利用该十进制数作为码表的索引获取对应的字符，并追加到sbEncoded
			sbEncoded.append(CODEC_TABLE.charAt(intFiveBit));

		}

		return sbEncoded.toString();

	}

	/**
	 * (解码/解密)字符串，采用默认语言环境的 character set。
	 *
	 *
	 * @param code
	 *            需要(解码/解密)的字符串
	 *
	 * @return (解码/解密)后的字符串
	 */
	public static String decode(String code) {

		return decode(code, null);

	}

	/**
	 * (解码/解密)字符串
	 *
	 *
	 * @param code
	 *            需要(解码/解密)的字符串
	 * @param characterSet
	 *            字符集
	 *
	 * @return (解码/解密)后的字符串
	 */
	public static String decode(String code, String characterSet) {

		if (code == null || code.length() < 1) {

			return "";

		}

		/*
		 * 拆除每一个字符，从码表里获取相应的索引。
		 */

		StringBuilder sbBinarys = new StringBuilder();

		for (int i = 0; i < code.length(); i++) {

			// 从码表里获取相应的索引
			int index = getCodecTableIndex(code.charAt(i));

			// 将十进制的索引转换为二进制串
			String indexBinary = Integer.toBinaryString(index);

			// 去掉前3个0，并且追加到sbBinarys
			FormatUtil.formatBinary(indexBinary, sbBinarys, FIVE_BIT);

		}

		/*
		 * 按8个bit拆分，剩下的余数扔掉。
		 * 扔掉的余数是在(编码/加密)的分割时候，在分剩的余数的后面补的0
		 */

		byte[] binarys = new byte[sbBinarys.length() / EIGHT_BIT];

		for (int i = 0, j = 0; i < binarys.length; i++) {

			// 每8个bit截取一份
			String sub = sbBinarys.substring(j, j += EIGHT_BIT);

			// 将截取下来的二进制串转换为十进制
			Integer intBinary = Integer.valueOf(sub, BINARY);

			binarys[i] = intBinary.byteValue();

		}

		String decoded = null;

		if (characterSet == null || characterSet.length() < 1) {

			// 采用默认语言环境的 character set。
			decoded = new String(binarys);

		} else {

			try {

				// 采用指定的 character set。
				return new String(binarys, characterSet);

			} catch (UnsupportedEncodingException e) {
				// ignore...
			}
		}
		return decoded;
	}

	/**
	 * 根据所给出的字符，遍历CODEC_TABLE，返回对应的下标。
	 * 如果没找到，则返回 -1。
	 *
	 * @param code
	 *            在CODEC_TABLE范围内的字符。
	 *
	 * @return 字符在CODEC_TABLE里对应的下标，如果没找到，则返回 -1。
	 */
	private static int getCodecTableIndex(char code) {

		for (int i = 0; i < CODEC_TABLE.length(); i++) {

			if (CODEC_TABLE.charAt(i) == code) {

				return i;

			}

		}

		return -1;

	}

    public static String encodeMd5(String keys) {
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(keys.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e) {
            System.out.println("NoSuchAlgorithmException caught!");
            System.exit(-1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        byte[] byteArray = messageDigest.digest();
        StringBuffer md5StrBuff = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            else
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
        }
        return md5StrBuff.toString();
    }
}