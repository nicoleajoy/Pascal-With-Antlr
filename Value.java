// Resource: https://github.com/bkiers/Mu/blob/master/src/main/java/mu/Value.java

public class Value {
    final Object value;
    
    public static Value VOID = new Value(new Object());

    public Value() {
        value = null;
    }

    public Value(Object v) {
        value = v;
    }

    public Boolean asBoolean() {
        return (Boolean)value;
    }

    public Double asDouble() {
        return (Double)value;
    }

    public String asString() {
        return String.valueOf(value);
    }

    public boolean isDouble() {
        return value instanceof Double;
    }

    public boolean isBoolean() {
        return value instanceof Boolean;
    }

    public boolean equals(Object o) {
        if (value == o) {
            return true;
        }
        if (value == null || o == null) {
            return false;
        }
        if (o.getClass() != value.getClass()) {
            return false;
        }
        Value that = (Value)o;
        return this.value.equals(that.value);
    }
}
