/*
 * generated by Xtext 2.10.0
 */
package org.slizaa.neo4j.opencypher.parser.antlr;

import com.google.inject.Inject;
import org.eclipse.xtext.parser.antlr.AbstractAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.slizaa.neo4j.opencypher.parser.antlr.internal.InternalOpenCypherParser;
import org.slizaa.neo4j.opencypher.services.OpenCypherGrammarAccess;

public class OpenCypherParser extends AbstractAntlrParser {

	@Inject
	private OpenCypherGrammarAccess grammarAccess;

	@Override
	protected void setInitialHiddenTokens(XtextTokenStream tokenStream) {
		tokenStream.setInitialHiddenTokens("RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT");
	}
	

	@Override
	protected InternalOpenCypherParser createParser(XtextTokenStream stream) {
		return new InternalOpenCypherParser(stream, getGrammarAccess());
	}

	@Override 
	protected String getDefaultRuleName() {
		return "Cypher";
	}

	public OpenCypherGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}

	public void setGrammarAccess(OpenCypherGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
}