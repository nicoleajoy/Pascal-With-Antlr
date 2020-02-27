// Resource: https://github.com/bkiers/tiny-language-antlr4/blob/master/src/main/java/tl/antlr4/Scope.java

import java.util.HashMap;
import java.util.Map;

public class Scope {
    private Scope scope;
    private Map<String,Value> symbolTable;

    Scope() {
        scope = null;
        symbolTable = new HashMap<String,Value>();
    }

    Scope(Scope p) {
        scope = p;
        symbolTable = new HashMap<String,Value>();
    }
    
    public Scope getScope() {
        return scope;
    }

    public boolean isGlobalScope() {
        return scope == null;
    }

    public void addToSymTab(String id, Value val) {
    	symbolTable.put(id, val);
    }
    
    public Value getValue(String id) {
        Value val = symbolTable.get(id);
        // If variable exists in scope
        if (val != null) {
            return val;
        }
        // If this isn't global scope, check parent scope
        else if (!isGlobalScope()) {
            return scope.getValue(id);
        }
        // If var found but no value, or if not found in any scope (not even global),
        // then var does not exist
        else {
            return null;
        }
    }

    public void setValue(String id, Value val) {
        // Variable exists in scope, so update its value
        if (getValue(id) != null) {
            this.resetValue(id, val);
        }
        // Create a variable in current scope
        else {
            symbolTable.put(id, val);
        }
    }

    public void resetValue(String id, Value val) {
        // Variable in scope
        if (symbolTable.containsKey(id)) {
            symbolTable.put(id, val);
        }
        // Variable not declared in this scope, check parent scope
        else if (scope != null) {
            scope.resetValue(id, val);
        }
    }

    @Override
    public String toString() {
    	StringBuilder sb = new StringBuilder();
    	for (Map.Entry<String,Value> var: symbolTable.entrySet()) {
    		sb.append(var.getKey()).append("->").append(var.getValue()).append(",");
    	}
    	return sb.toString();
    }
}