package de.ragedev.franca.example.impl.generator

import com.google.inject.Inject
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.franca.core.dsl.FrancaIDLInjectorProvider
import org.franca.core.dsl.FrancaPersistenceManager
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(FrancaIDLInjectorProvider))
class HelloWorldGeneratorTest {

	@Inject
	FrancaPersistenceManager loader;

	@Test
	def void runGenerator() {
		val generator = new HelloWorldGenerator

		val root = URI.createURI("classpath:/")
		val loc = URI.createFileURI("de/ragedev/franca/example/HelloWorld.fidl")

		val fmodel = loader.loadModel(loc, root)		

		println("Franca IDL: package '" + fmodel.getName() + "'").toString
//		
//		// generate code from first interface in Franca model
//		assertTrue(fmodel.getInterfaces().size()>0);
//		FInterface api = fmodel.getInterfaces().get(0);
//		ExampleHppGenerator generator = new ExampleHppGenerator();
//		String code = generator.generateInterface(api).toString();
//		System.out.println("Generated code:\n" + code);
//		
//FileHelper.save("src-gen", getBasename(fmodel) + ".hpp", code);
	}
}
