package io.github.mellivorines.blog

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@SpringBootTest
class MellivorinesBlogSpringbootApplicationTests {

    @Test
    fun contextLoads() {
        // 该测试加密管理员密码：根据自己的需要设置密码即可
        println( BCryptPasswordEncoder().encode("123456"))
    }

}
