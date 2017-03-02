package de.ragedev.franca.example.impl.generator

import com.google.inject.Inject
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.franca.core.dsl.FrancaIDLInjectorProvider
import org.franca.core.dsl.FrancaPersistenceManager
import org.franca.core.franca.FModel
import org.franca.core.utils.FileHelper
import org.junit.Test
import org.junit.runner.RunWith
import java.nio.file.Files
import java.nio.file.Paths

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(FrancaIDLInjectorProvider))
class HelloWorldGeneratorTest {

	@Inject
	FrancaPersistenceManager loader;

	@Test
	def void runGenerator() {

		val root = URI.createURI("classpath:/")
		val loc = URI.createFileURI("de/ragedev/franca/example/HelloWorld.fidl")

		val FModel fmodel = loader.loadModel(loc, root)

		println("Franca IDL: package '" + fmodel.interfaces.get(0).name + "'").toString

		val api = fmodel.getInterfaces().get(0);
		val generator = new HelloWorldGenerator(fmodel.name)
		val code = generator.generateInterface(api).toString();
		
		val folder = fmodel.name.replaceAll("\\.","/")
		FileHelper.save("src-gen/" + folder + "/", fmodel.interfaces.get(0).name + ".java", code);
	}
}
