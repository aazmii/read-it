import com.android.build.gradle.BaseExtension
import org.gradle.api.tasks.Delete
import java.io.File

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Set custom root build directory
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    // Fix for verifyReleaseResources
    afterEvaluate {
        if (plugins.hasPlugin("com.android.application") || plugins.hasPlugin("com.android.library")) {
            extensions.findByType<BaseExtension>()?.apply {
                compileSdkVersion(34)
                buildToolsVersion("34.0.0")
                if (namespace == null) {
                    namespace = project.group.toString()
                }
            }
        }
    }

    // Set custom subproject build directory
    layout.buildDirectory.set(File(rootProject.buildDir, name))

    // Ensure `:app` is evaluated first
    evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
