package com.shopin.modules.cache.xmemcached.transcoders;

import net.rubyeye.xmemcached.transcoders.BaseSerializingTranscoder;
import net.rubyeye.xmemcached.transcoders.CachedData;
import net.rubyeye.xmemcached.transcoders.Transcoder;
import net.rubyeye.xmemcached.transcoders.TranscoderUtils;
import java.util.Date;

/**
 * Transcoder that serializes and compresses objects.
 */
public class TTSerializingTranscoder extends BaseSerializingTranscoder implements
        Transcoder<Object> {

	public void setPackZeros(boolean packZeros) {
		this.tu.setPackZeros(packZeros);

	}

	public void setPrimitiveAsString(boolean primitiveAsString) {
		this.primitiveAsString = primitiveAsString;
	}

	private final int maxSize;

	private boolean primitiveAsString;

	public final int getMaxSize() {
		return this.maxSize;
	}

	// General flags
	public static final int SERIALIZED = 1;
	public static final int COMPRESSED = 2;

	// Special flags for specially handled types.
	public static final int SPECIAL_MASK = 0xff00;
	public static final int SPECIAL_BOOLEAN = (1 << 8);
	public static final int SPECIAL_INT = (2 << 8);
	public static final int SPECIAL_LONG = (3 << 8);
	public static final int SPECIAL_DATE = (4 << 8);
	public static final int SPECIAL_BYTE = (5 << 8);
	public static final int SPECIAL_FLOAT = (6 << 8);
	public static final int SPECIAL_DOUBLE = (7 << 8);
	public static final int SPECIAL_BYTEARRAY = (8 << 8);

	private final TranscoderUtils tu = new TranscoderUtils(true);

	/**
	 * Get a serializing transcoder with the default max data size.
	 */
	public TTSerializingTranscoder() {
		this(CachedData.MAX_SIZE);
	}

	/**
	 * Get a serializing transcoder that specifies the max data size.
	 */
	public TTSerializingTranscoder(int max) {
		this.maxSize = max;
	}
	public boolean isPackZeros() {
		return this.tu.isPackZeros();
	}

	public boolean isPrimitiveAsString() {
		return this.primitiveAsString;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see net.spy.memcached.Transcoder#decode(net.spy.memcached.CachedData)
	 */
	public final Object decode(CachedData d) {
		byte[] result = d.getData();
        byte[] data = new byte[result.length-4];
        byte[] flag = new byte[4];
        System.arraycopy(result,0,flag,0,4);
        System.arraycopy(result,4,data,0,result.length-4);
        int flags = byte2Int(flag);
		Object rv = null;
		if ((flags & COMPRESSED) != 0) {
			data = decompress(data);
		}
		if ((flags & SERIALIZED) != 0 && data != null) {
			rv = deserialize(data);
		} else {
			if (this.primitiveAsString) {
				if (flags == 0) {
					return decodeString(data);
				}
			}
			if (flags != 0 && data != null) {
				switch (flags) {
				case SPECIAL_BOOLEAN:
					rv = Boolean.valueOf(this.tu.decodeBoolean(data));
					break;
				case SPECIAL_INT:
					rv = Integer.valueOf(this.tu.decodeInt(data));
					break;
				case SPECIAL_LONG:
					rv = Long.valueOf(this.tu.decodeLong(data));
					break;
				case SPECIAL_BYTE:
					rv = Byte.valueOf(this.tu.decodeByte(data));
					break;
				case SPECIAL_FLOAT:
					rv = new Float(Float
							.intBitsToFloat(this.tu.decodeInt(data)));
					break;
				case SPECIAL_DOUBLE:
					rv = new Double(Double.longBitsToDouble(this.tu
							.decodeLong(data)));
					break;
				case SPECIAL_DATE:
					rv = new Date(this.tu.decodeLong(data));
					break;
				case SPECIAL_BYTEARRAY:
					rv = data;
					break;
				default:
					log.warn(String.format("Undecodeable with flags %x",flags));
				}
			} else {
				rv = decodeString(data);
			}
		}
		return rv;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see net.spy.memcached.Transcoder#encode(java.lang.Object)
	 */
	public final CachedData encode(Object o) {
		byte[] b = null;
		int flags = 0;
		if (o instanceof String) {
			b = encodeString((String) o);
		} else if (o instanceof Long) {
			if (this.primitiveAsString) {
				b = encodeString(o.toString());
			} else {
				b = this.tu.encodeLong((Long) o);
			}
			flags |= SPECIAL_LONG;
		} else if (o instanceof Integer) {
			if (this.primitiveAsString) {
				b = encodeString(o.toString());
			} else {
				b = this.tu.encodeInt((Integer) o);
			}
			flags |= SPECIAL_INT;
		} else if (o instanceof Boolean) {
			if (this.primitiveAsString) {
				b = encodeString(o.toString());
			} else {
				b = this.tu.encodeBoolean((Boolean) o);
			}
			flags |= SPECIAL_BOOLEAN;
		} else if (o instanceof Date) {
			b = this.tu.encodeLong(((Date) o).getTime());
			flags |= SPECIAL_DATE;
		} else if (o instanceof Byte) {
			if (this.primitiveAsString) {
				b = encodeString(o.toString());
			} else {
				b = this.tu.encodeByte((Byte) o);
			}
			flags |= SPECIAL_BYTE;
		} else if (o instanceof Float) {
			if (this.primitiveAsString) {
				b = encodeString(o.toString());
			} else {
				b = this.tu.encodeInt(Float.floatToRawIntBits((Float) o));
			}
			flags |= SPECIAL_FLOAT;
		} else if (o instanceof Double) {
			if (this.primitiveAsString) {
				b = encodeString(o.toString());
			} else {
				b = this.tu.encodeLong(Double.doubleToRawLongBits((Double) o));
			}
			flags |= SPECIAL_DOUBLE;
		} else if (o instanceof byte[]) {
			b = (byte[]) o;
			flags |= SPECIAL_BYTEARRAY;
		} else {
			b = serialize(o);
			flags |= SERIALIZED;
		}
		assert b != null;
		if (this.primitiveAsString) {
			// It is not be SERIALIZED,so change it to string type
			if ((flags & SERIALIZED) == 0) {
				flags = 0;
			}
		}
		if (b.length > this.compressionThreshold) {
			byte[] compressed = compress(b);
			if (compressed.length < b.length) {
				if (log.isDebugEnabled()) {
					log.debug("Compressed " + o.getClass().getName() + " from "
							+ b.length + " to " + compressed.length);
				}
				b = compressed;
				flags |= COMPRESSED;
			} else {
				if (log.isDebugEnabled()) {
					log.debug("Compression increased the size of "
							+ o.getClass().getName() + " from " + b.length
							+ " to " + compressed.length);
				}
			}
		}
        byte[] data = new byte[b.length+4];
        System.arraycopy(Int2Byte(flags),0,data,0,4);
        System.arraycopy(b,0,data,4,b.length);
		return new CachedData(flags, data, this.maxSize, -1);
	}

    public synchronized static byte[] Int2Byte(int send) {
        byte[] bTemp = new byte[4];
        for (int i = 0; i < 4; i++) {
            bTemp[i] = (byte) ((send >> (i * 8)) & 0xFF);
        }
        return bTemp;
    }


    public static int byte2Int(byte[] b) {
        int intValue = 0;
        for (int i = 0; i < b.length; i++) {
            intValue += (b[i] & 0xFF) << (8 * i);
        }
        return intValue;
    }


}