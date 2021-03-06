<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<!-- saved from url=(0046)http://res.kuyumall.com/document/standard.html -->
<html lang="en_us"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http_equiv="X_UA_Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <title>事务知识点整理</title>
   		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    </head>
    <body youdao="bind">

	<%@ include file="/jsp/common/headbread.jsp" %>

<div class="heading" id="css">
  <h2>事务</h2>
</div>

<div class="section" id="css_declaration_order">
    <div class="col">
        <h3>事务概念</h3>
        <p>事务是数据库管理系统执行过程中的一个逻辑单位，由一个有限的数据库操作序列构成。</p>
    </div>
    <div class="col">
        <div class="highlight">
         <pre>
         	<p>说简单点就是，要么所有执行success，不然就fail。 它最终的目标：数据不会被破坏。即事务操作成功，数据的结果和业务期待的结果是一致的。</p>
         </pre>
		</div>
    </div>
</div>

<div class="section" id="css_declaration_order">
    <div class="col">
         <h3>事务的属性</h3>
         <p>一个逻辑工作单元要成为事务，必须满足所谓的ACID（原子性、一致性、隔离性和持久性）属性</p>
       	 <ol>
            <li>原子性(Atomicity)</li>
            <li>一致性(Consistency)</li>
            <li>隔离性(Isolation)</li>
            <li>持久性(Durability)</li>
       	</ol>
    </div>
    <div class="col">
        <div class="highlight">
        <!-- <img  src="/image/0.jpeg" style="height: 50%;width: 50%;"> -->
        <pre>
    <p>1：原子性（Atomicity）：原子性要求事务作为一个不可分割的整体被执行，包含在其中的对数据库的操作要么全部被执行，要么都不执行（其中有一个操作失败，就全部失败）。<p/>
	<p>2：一致性（Consistency）：一致性要求事务应确保数据库的状态从<b>一个一致状态</b>转变为<b>另一个一致状态</b>。一致状态的含义是数据库中的数据应满足完整性约束。<br/>
	<span style="color: red;">执行前数据间的一致性状态 === 执行后数据间的一致性状态</span></p>
	<p>3：隔离性（Isolation）： 事务的隔离性要求多个事务并发执行时，一个事务的执行不应影响其他事务的执行。<p/>
	<p>4：持久性（Durability）：事务的持久性是一旦整个事务提交成功，数据的修改应该永久保存在数据库中，并不可逆转。<p/>
        </pre>
		</div>
    </div>
</div>

<div class="section" id="css_declaration_order">
    <div class="col">
        <h3>隔离性（Isolation）</h3>
        <p> 事务指定了4种隔离级别（从弱到强分别是）：</p>
        <ol>
        	<li>Read Uncommitted</li>
        	<li>Read Committed</li>
        	<li>Repeatable Read</li>
        	<li>Serializable</li>
        </ol>
        <p>在事务的并发操作中可能会出现<b>脏读（dirty read），不可重复读（repeatable read），幻读（phantom read）</b>。</p>
        <a href="${pageContext.request.contextPath}/image/Isolation-level.png" target="_blank">
        	<img  src="${pageContext.request.contextPath}/image/Isolation-level.png" style="height: 50%;width: 100%;">
        </a>
         
    </div>
    <div class="col">
        <div class="highlight">
         <pre>
         	  <p>1：Read Uncommitted（读未提交）：一个事务可以读取另一个未提交事务的数据。<p/>
         	  <p>2：Read Committed（读提交）：一个事务要等另一个事务提交后才能读取数据。<p/>
         	  <p>3：Repeatable Read（重复读）：在开始读取数据（事务开启）时，不再允许修改操作。<p/>
         	  <p>4：Serializable（序列化）：Serializable 是最高的事务隔离级别，在该级别下，事务串行化顺序执行，可以避免脏读、不可重复读与幻读。<p/>
         	  <p><b style="color: red;">大多数数据库默认的事务隔离级别是Read committed，比如Sql Server , Oracle。MySQL的默认隔离级别是Repeatable read。</b></p>
         	  <p><a href="http://blog.csdn.net/qq_33290787/article/details/51924963" target="_blank" >举例：理解事务的4种隔离级别</a></p>
         </pre>
         <p><b>注:Mysql查询事务隔离级别：</b></p>
         <ol>
         	<li>查看当前会话隔离级别：select @@tx_isolation;</li>
         	<li>查看系统当前隔离级别：select @@global.tx_isolation;</li>
         	<li>设置当前会话隔离级别：set session transaction isolation level repeatable read;</li>
         	<li>设置当前会话隔离级别：set global transaction isolation level repeatable read;</li>
         </ol>
		</div>
    </div>
</div>

<div class="section" id="css_declaration_order">
    <div class="col">
        <h3>ACID生动解释</h3>
    </div>
    <div class="col">
        <div class="highlight">
        <pre>
        	<p><a href="http://www.bysocket.com/?p=1154" target="_blank">举例：图解——事务必会必知</a></p>
        </pre>
		</div>
    </div>
</div>
<div class="section" id="css_declaration_order">
    <div class="col">
        <h3>Spring事务的传播性</h3>
        <ol>
        	<li>Spring中事务的传播行为？</li>
        	<li>Spring事务的隔离级别?</li>
        	<li>Spring事务的架构？</li>
        	<li>使用Spring如何进行事务管理？</li>
        </ol>
        <a href="${pageContext.request.contextPath}/image/Isolation-spread.png" target="_blank">
     	 	<img  src="${pageContext.request.contextPath}/image/Isolation-spread.png"  style="height: 50%;width: 100%;">
     	</a>
      <p><b>附：</b></p>
      <p> 什么是事务的传播特性?：<a href="http://javaeye-mao.iteye.com/blog/1501534" target="_blank">http://javaeye-mao.iteye.com/blog/1501534</a></p>
      <p> 一图学习 Spring事务传播性：<a href="http://ju.outofmemory.cn/entry/113944" target="_blank">http://ju.outofmemory.cn/entry/113944</a></p>
    </div>
    <div class="col">
        <div class="highlight">
        <pre>
<p>事务的传播级别和数据隔离级别，是事务控制的两个主要特性。传播级别定义的是事务的控制范围，事务隔离级别定义的是事务在数据库读写方面的控制范围。</p>
<span>（1）：Spring事务传播性有七种，REQUIRED、SUPPORTS、REQUIRES-NEW、NOT-SUPPORTED、MANDATORY、NEVER、NESTED。如下思维导图：</span>
<a href="${pageContext.request.contextPath}/image/transaction-propagation.png" target="_blank">
<img  src="${pageContext.request.contextPath}/image/transaction-propagation.png" style="height: 80%;width: 100%;">
</a>
Spring事务的传播特性： 
1. PROPAGATION_REQUIRED: 如果存在一个事务，则支持当前事务。如果没有事务则开启新的事物。 
2. PROPAGATION_SUPPORTS: 如果存在一个事务，支持当前事务。如果没有事务，则非事务的执行。 
3. PROPAGATION_MANDATORY: 如果已经存在一个事务，支持当前事务。如果没有一个活动的事务，则抛出异常。 
4. PROPAGATION_REQUIRES_NEW: 总是开启一个新的事务。如果一个事务已经存在，则将这个存在的事务挂起。 
5. PROPAGATION_NOT_SUPPORTED: 总是非事务地执行，并挂起任何存在的事务。 
6. PROPAGATION_NEVER: 总是非事务地执行，如果存在一个活动事务，则抛出异常 
7.(spring)PROPAGATION_NESTED：如果一个活动的事务存在，则运行在一个嵌套的事务中. 如果没有活动事务, 则按TransactionDefinition.PROPAGATION_REQUIRED 属性执行。
<hr/>
Spring事务的隔离级别：
1. ISOLATION_DEFAULT：这是一个PlatfromTransactionManager默认的隔离级别，使用数据库默认的事务隔离级别。 
2. ISOLATION_READ_UNCOMMITTED：这是事务最低的隔离级别，它充许令外一个事务可以看到这个事务未提交的数据。 
3. ISOLATION_READ_COMMITTED：保证一个事务修改的数据提交后才能被另外一个事务读取。另外一个事务不能读取该事务未提交的数据。 
4. ISOLATION_REPEATABLE_READ：这种事务隔离级别可以防止脏读，不可重复读。但是可能出现幻像读。它除了保证一个事务不能读取另一个事务未提交的数据外，还保证了避免下面的情况产生(不可重复读)。 
5. ISOLATION_SERIALIZABLE 这是花费最高代价但是最可靠的事务隔离级别。事务被处理为顺序执行。除了防止脏读，不可重复读外，还避免了幻像读。 
除了第一个是spring特有的，另外四个与JDBC的隔离级别相对应。第二种隔离级别会产生脏读，不可重复读和幻像读，特别是脏读，一般情况下 是不允许的，所以这种隔离级别是很少用到的。大多说数据库的默认格里基本是第三种。它能消除脏读，但是可重复读保证不了。第四种隔离级别也有一些数据库作 为默认的隔离级别，比如MySQL。最后一种用的地方不多，除非是多数据访问的要求特别高，否则轻易不要用它，因为它会严重影响数据库的性能 

        </pre>
		</div>
    </div>
</div>
<div class="section" id="css_declaration_order">
    <div class="col">
        <h3>Spring事务的架构和如何配置事务管理？</h3>
        <h4>架构</h4>
        <p>Spring 的事务框架设计理念的基本原则是：让事务管理的关注点与数据访问关注点相分离。</p>
        <h4>事务管理配置</h4>
        <ol>
        	<li>编程式事务</li>
        	<li>声明式事务</li>
        </ol>
    </div>
    <div class="col">
        <div class="highlight">
        <pre>
<h4>架构</h4>
Spring 的事务抽象包括3个主要接口，分别是PlatformTransactionManager、TransactionDefinition、TransactionSatus。

PlatformTransactionManager负责界定事务边界；TransactionDefinition负责定义事务的相关属性，包括隔离级别、传播行为等；PlatformTransactionManager参照TransactionDefinition的属性定义来开启相关事务。事务开启之后到事务结束期间的事务状态由TransactionStatus负责，我们可以通过TransactionStatus对事务进行有限的控制。

TransactionDefinition常用的实现有DefaultTransactionDefinition和TransactionTemplate（这两个主要用于编程式的事务场景）、DefaultTransactionAttribute和RuleBasedTransactionAttribute（这两个主要使用Spring AOP 进行声明式事务管理的场景中，RuleBasedTransactionAttribute允许我们同时制定多个回滚规则）。

TransactionStatus有一个实现类DefaultTransactionStatus用来记录事务的状态信息。
PlatformTransactionManager的实现类可以分为面向局部事务和面向全局事务两个分支。常用的面向局部事务的PlatformTransactionManager有DataSourceTransactionManager(用于JDBC和Mybatis)和HibernateTransactionManager。
<hr/>
<h4>事务管理配置</h4>
1：<b>编程式事务</b>
	   通过Spring 进行编程式事务管理有两种方式，要么直接使用PlatformTransactionManager，要么使用更方便的TransactionTemplate。
2：<b>声明式事务</b>
	  Spring提供了用于声明式事务管理的拦截器TransactionIntercepter（该拦截器用于查询记载着业务方法与对应事务信息之间关系的映射文件（事务驱动的元数据（Metadata））来决定要不要为当前业务方法创建事务）。有了TransactionIntercepter，我们所要做的就是决定使用XML元数据驱动还是使用注解元数据驱动的声明式事务管理。
	  
（1）、<b>XML元数据驱动的声明式事务</b>
<span style="color: green"> 
可以使用4种配置方式在IoC容器的配置文件中指定事务需要的元数据。
①、使用ProxyFactory（ProxyFactoryBean）+ TransactionIntercepter。
②、使用“一站式”的TransactionProxyFactoryBean。
③、使用BeanNameAutoProxyCreator。
④、使用Spring的声明式事务。
< tx:advice id="advice" transaction-manager="transactionManager">
      < tx:attributes>
          < tx:method name="save*" propagation="REQUIRED"/>
          < tx:method name="delete*" propagation="REQUIRED"/>
          < tx:method name="update*" propagation="REQUIRED"/>
          < tx:method name="add*" propagation="REQUIRED"/>
          < tx:method name="*" propagation="SUPPORTS" read-only="true"/>
      < /tx:attributes>
< /tx:advice>
                   
⑤: 切入表达式: 配置运行的时候*包的*类切入通知
 < aop:config>
   < aop:pointcut expression="execution(* com.shop.service.impl.*.*(..))" id="pointcut"/>
   < aop:advisor advice-ref="advice" pointcut-ref="pointcut"/>
< /aop:config>

< tx:advice>是专门为声明式事务Advice而设置的配置元素，底层当然还是我们的TransactionIntercepter。 
</span>             
（2）、<b>注解元数据驱动的声明式事务</b>
<span style="color: green"> 
Spring 定义了org.springframework.transaction.annotation.Transactional用于标注业务方法所对应的事务元数据的信息。可以标注在业务方法或者业务方法所在的类的定义上。
使用注解元驱动的声明式事务管理，基本上就需要两步：
①、使用@Transactional标注相应的业务对象及相关方法。
②、在容器的配置文件中启用事务注解
< !-- 开启注解事务 只对当前配置文件有效 -->
< tx:annotation-driven transaction-manager="transactionManager"/>	  
</span>
        	<p><p>Spring事务配置及事务的传播性与隔离级别详解：<a href="http://opiece.me/2016/03/18/spring-transactional-introduce/" target="_blank">http://opiece.me/2016/03/18/spring-transactional-introduce/</a></p></p>
        </pre>
		</div>
    </div>
</div>

<p/>
<p/>
<p/>
</body>
</html>