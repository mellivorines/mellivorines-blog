package io.github.mellivorines.blog

import cn.xuyanwu.spring.file.storage.spring.EnableFileStorage
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication


@EnableFileStorage
@SpringBootApplication
class MellivorinesBlogSpringbootApplication

fun main(args: Array<String>) {
    runApplication<MellivorinesBlogSpringbootApplication>(*args)
}
