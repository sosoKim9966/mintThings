package com.shop.mint.jwtConfig;

import com.shop.mint.general.login.service.LoginService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.net.Authenticator;
import java.util.Base64;
import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Component
public class JwtTokenProvider {

    private String secretKey = "hashKey";

    // 토큰 유효시간 30분
    private long tokenValidTime = 30 * 60 * 1000L;
    private final UserDetailsService userDetailsService;

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : 객체 초기화, secretKey Base64 인코딩
     * </pre>
     *
     * @return
     */
    @PostConstruct
    protected void init() {
        secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
    }

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : 토큰 생성
     * </pre>
     *
     * @return
     */
    public String createToken(String userPK, List<String> roles) {
        Claims claims = Jwts.claims().setSubject(userPK); // JWT payload에 저장되는 정보 단위
        claims.put("roles", roles); // 정보는 key /value로 저장
        Date now = new Date();
        return Jwts.builder()
                .setClaims(claims)  // 정보저장
                .setIssuedAt(now)   // 토큰 발행 시간
                .setExpiration(new Date(now.getTime() + tokenValidTime))    // 만료시간
                .signWith(SignatureAlgorithm.HS256, secretKey)  // 암호화
                .compact();
    }

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : JWT 토큰에서 인증 정보 조회
    * </pre>
     *
     * @return
     */
    public Authentication getAuthentication(String token) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(this.getUserPk(token));
        return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
    }

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : 회원 정보 추출
     * </pre>
     *
     * @return
     */
    public String getUserPk(String token) {
        return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getSubject();
    }

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : Request의 Header에서 token 가져오기
     * </pre>
     *
     * @param request
     * @return
     */
    public String resolveToken(HttpServletRequest request) {
        return request.getHeader("X-AUTH-TOKEN");
    }

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : 토큰 유효성 / 만료일자 확인
     * </pre>
     *
     * @return
     */
    public boolean validateToken(String jwtToken) {
        try {
            Jws<Claims> claims = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(jwtToken);
            return !claims.getBody().getExpiration().before(new Date());
        } catch (Exception e) {
            return false;
        }
    }



}
