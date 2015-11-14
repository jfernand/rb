import std.conv;
import std.format;

const int STX    = 0;
const int CMD    = 1;
const int MASK   = 2;
const int PARAM1 = 3;
const int PARAM2 = 4;
const int CHKSUM = 5;
const int ETX    = 6;

const int RELAY1 = 0x1;
const int RELAY2 = 0x2;
const int RELAY3 = 0x4;
const int RELAY4 = 0x8;
const int RELAY5 = 0x11;
const int RELAY6 = 0x12;
const int RELAY7 = 0x14;
const int RELAY8 = 0x18;

const int RELAYS_ON        = 0x11;
const int RELAYS_OFF       = 0x13;
const int RELAYS_TOGGLE    = 0x14;
const int RELAY_STATUS     = 0x18;
const int SET_BUTTON_MODE  = 0x21;
const int GET_BUTTON_MODE  = 0x22;
const int START_TIMERS     = 0x41;
const int SET_TIMERS       = 0x42;
const int GET_TIMERS       = 0x44;
const int RESET_DEFAULTS   = 0x66;
const int GET_JUMPERS      = 0x70;
const int GET_VERSION      = 0x71;

class Packet {
	private ubyte[7] buf = new ubyte[7];
	this() {
		buf[STX] = 0x04;
		buf[ETX] = 0x0f;
	}

	Packet cmd(ubyte cmd) {
		buf[CMD] = cmd;
		return this;
	}

    // bit 0-7 -> relay 1-8
	Packet mask(ubyte mask) {
		buf[MASK] = mask;
		return this;
	}

	Packet setMomentaryMode(ubyte mask) {
		(buf[MASK] = mask);
		return this;
	}

	Packet param1(ubyte p1) {
		buf[PARAM1] = p1;
		return this;
	}

	Packet setToggleMode(ubyte mask) {
		buf[PARAM1] = mask;
		return this;
	}

	Packet param2(ubyte p2) {
		buf[PARAM2] = p2;
		return this;
	}

	Packet setTimedMode(ubyte mask) {
		buf[PARAM2] = mask;
		return this;
	}

    Packet setTimer(ushort timer) {
    	buf[PARAM1] = cast(ubyte)(timer >> 8);
    	buf[PARAM2] = cast(ubyte)(timer & 0xff);
    	return this;
    }

	private void _chksum() {
		ubyte sum;
		foreach(i; STX..5) {
			sum += buf[i];
		}
		buf[CHKSUM] = ~sum;
	}

    public bool verify() {
    	ubyte sum;
		foreach(i; STX..6) {
			sum += buf[i];
		}
		return sum == 255;
    }

    public ubyte[] bytes() {
    	_chksum();
    	assert(verify());
    	return buf;
    }

	override string toString () {
		_chksum();
		return format("%(%02X %)", buf);
	}

	unittest {
		import std.stdio;

		auto p = new Packet;
		writeln(
			p.cmd(0x11)
				.mask(0x5A)
				.param1(0xA5)
				.param2(0x5A)
		);
		assert(p.verify());
		writeln(
			p.cmd(0x12)
				.mask(0x5A)
				.param1(0xA5)
				.param2(0x5A)
		);
		assert(p.verify());
	}
}