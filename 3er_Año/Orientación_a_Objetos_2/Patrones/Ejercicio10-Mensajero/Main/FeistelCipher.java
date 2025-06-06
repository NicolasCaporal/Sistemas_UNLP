package io.github.unlp;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * @author gperez
 *
 */
public class FeistelCipher {
	private String key;
	private final int rounds = 4;

	public FeistelCipher(String keyStr) {
		this.key = keyStr;
	}

	private byte[] feistelBlock(byte[] block) {
	    int left = ((block[0] & 0xFF) << 24) | ((block[1] & 0xFF) << 16) | ((block[2] & 0xFF) << 8) | (block[3] & 0xFF);
	    int right = ((block[4] & 0xFF) << 24) | ((block[5] & 0xFF) << 16) | ((block[6] & 0xFF) << 8) | (block[7] & 0xFF);
	    int keySum = key.chars().sum() % (1 << 32);
	    
	    for (int i = 0; i < rounds; i++) {
	        int temp = left;
	        left = right;
	        right = temp ^ ((right + keySum) % (1 << 32));
	    }
	    
	    int temp = left;
	    left = right;
	    right = temp;
	    
	    byte[] result = new byte[8];
	    result[0] = (byte) (left >>> 24);
	    result[1] = (byte) (left >>> 16);
	    result[2] = (byte) (left >>> 8);
	    result[3] = (byte) (left);
	    result[4] = (byte) (right >>> 24);
	    result[5] = (byte) (right >>> 16);
	    result[6] = (byte) (right >>> 8);
	    result[7] = (byte) (right);
	    return result;
	}

	public String encode(String message) {
		byte[] bytes = message.getBytes(StandardCharsets.UTF_8);
		int length = bytes.length;
		int paddedLength = ((length + 7) / 8) * 8;
		byte[] padded = Arrays.copyOf(bytes, paddedLength);

		byte[] result = new byte[paddedLength];
		for (int i = 0; i < paddedLength; i += 8) {
			byte[] block = Arrays.copyOfRange(padded, i, i + 8);
			byte[] encodedBlock = feistelBlock(block);
			System.arraycopy(encodedBlock, 0, result, i, 8);
		}

		return new String(result, StandardCharsets.ISO_8859_1).replaceAll("\\x00+$", "");
	}
}