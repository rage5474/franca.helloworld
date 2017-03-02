package de.ragedev.franca.example.impl.generator

import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FTypeRef

class HelloWorldGenerator {

	String _packageName
	
	new(String packageName) {
		_packageName = packageName
	}
	
	def generateInterface(FInterface api) '''
	package «_packageName»;
	
	public interface «api.classname» {
		«FOR m : api.methods»
			«m.generateMethodDecl» 
		«ENDFOR»
	}
	'''

	def generateMethodDecl(FMethod it) '''
		void «name»(«FOR a : inArgs SEPARATOR ', '»«a.type.generate» «a.name»«ENDFOR»);
	'''

	def generate(FTypeRef it) {
		if (derived != null) {
			derived.name
		} else {
			switch (predefined) {
				case FBasicTypeId::INT8: "int"
				case FBasicTypeId::INT16: "int"
				case FBasicTypeId::INT32: "int"
				case FBasicTypeId::UINT8: "int"
				case FBasicTypeId::UINT16: "int"
				case FBasicTypeId::UINT32: "long"
				case FBasicTypeId::STRING: "String"
				default: "/*" + predefined.toString + "*/" // TODO
			}
		}
	}

	def private getClassname(FInterface it) {
		name
	}

}
