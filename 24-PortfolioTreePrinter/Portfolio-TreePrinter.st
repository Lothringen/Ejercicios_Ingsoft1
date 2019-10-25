!classDefinition: #PortfolioTest category: #'Portfolio-TreePrinter'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:15'!
test08PortfolioTransasctionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-TreePrinter'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #ReportTest category: #'Portfolio-TreePrinter'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 12:29:30'!
test01NewAccountSummaryReturnsBalanceEqualsCero

	|account|

	account := ReceptiveAccount new.
	self assert: (AccountSummary with:account) value equals: 'Balance = 0'.
	! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 12:29:52'!
test02AccountSummaryRecognizesSeveralTransactions

	|senderAccount receiverAccount|

	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 50 on: senderAccount. 
	Withdraw register: 10 on: senderAccount.
	Transfer register: 20 from: senderAccount  to: receiverAccount. 
	Transfer register: 10 from: receiverAccount  to: senderAccount. 
	self assert: (AccountSummary with:senderAccount) value equals:
'Deposito por 50.
Extraccion por 10.
Salida por transferencia de 20.
Entrada por transferencia de 10.
Balance = 30'.! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 15:01:03'!
test03TransferNetRecognizesSeveralTransactions

	|receptiveAccount|

	receptiveAccount := ReceptiveAccount new.
	self assert: (TransferNet with:receptiveAccount) value equals: 0.! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 15:01:09'!
test04TransferNetRecognizesSeveralTransactions

	|senderAccount receiverAccount|

	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	"Deposit register:50  on: senderAccount."
	Transfer register: 20 from: senderAccount  to: receiverAccount. 
	Transfer register: 10 from: receiverAccount  to: senderAccount. 
	self assert: (TransferNet with:senderAccount) value equals: -10.! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/22/2019 20:24:23'!
test05ANamedReceptiveAccountKnowsItsName  

	|anAccount |

	anAccount := ReceptiveAccount named: 'Una Cuenta'.
	self assert: (anAccount accountName) equals: 'Una Cuenta'.! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/22/2019 20:52:21'!
test06ANamedPortfolioKnowsItsName  

	|aPortfolioOne aPortfolioTwo aPortfolioThree anAccountOne anAccountTwo|

	aPortfolioOne := Portfolio named: 'Un Portfolio'.
	anAccountOne := ReceptiveAccount new.
	anAccountTwo := ReceptiveAccount new.
	aPortfolioTwo :=  Portfolio named: 'Un Segundo Portfolio' with: anAccountOne.
	aPortfolioThree :=  Portfolio named: 'Un Tercer Portfolio' with: anAccountTwo with:aPortfolioTwo.
	self assert: (aPortfolioOne accountName) equals: 'Un Portfolio'.
	self assert: (aPortfolioTwo accountName) equals: 'Un Segundo Portfolio'.
	self assert: (aPortfolioThree accountName) equals: 'Un Tercer Portfolio'. ! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 14:18:12'!
test07TreeReportPrintsAnEmptyAccountCorrectly  

	| myAccount |

	myAccount := ReceptiveAccount named: 'R2D2'.
	self assert: (TreeReport with:myAccount) value equals:
'R2D2
	Balance = 0'! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 14:22:03'!
test08TreeReportPrintsAnotherAccountCorrectly  

	| myAccount |

	myAccount := ReceptiveAccount named: '3CPO'.
	Deposit register: 50 on: myAccount. 
	self assert: (TreeReport with:myAccount) value equals:
'3CPO
	Deposito por 50
	Balance = 50'! !

!ReportTest methodsFor: 'tests' stamp: 'cl 10/25/2019 14:22:10'!
test09TreeReportPrintsPortfolioCorrectly  

	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount |

	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta Mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	self assert: (TreeReport with: familyPortfolio ) value equals: 
'Portfolio de la familia
	Cuenta Mia
		Balance = 0
	Portfolio de hijos
		Cuenta de Juan
			Balance = 0
		Cuenta de Angeles
			Balance = 0
		Balance = 0
	Balance = 0'! !


!classDefinition: #TransfersTest category: #'Portfolio-TreePrinter'!
TestCase subclass: #TransfersTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!TransfersTest methodsFor: 'tests' stamp: 'cl 10/21/2019 20:37:17'!
test01AccountCanPerformAValidTransferToAnotherAccount

	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 on: accountSender.
	Transfer register: 50 from: accountSender to: accountReceiver.
	
	self assert: 50 equals: accountSender balance.
	self assert: 50 equals: accountReceiver balance.! !

!TransfersTest methodsFor: 'tests' stamp: 'cl 10/21/2019 20:45:31'!
test02AccountKnowsItsTransferTransactions 

	| accountSender accountReceiver aTransfer |
	
	accountSender := ReceptiveAccount new.	
	accountReceiver := ReceptiveAccount  new.
	aTransfer := Transfer register: 50 from: accountSender to: accountReceiver.
	
	self assert: 1 equals: accountSender transactions size.
	self assert: 1 equals: accountReceiver transactions size.
	self assert: (accountSender transactions includes: aTransfer senderTransaction).
	self assert: (accountReceiver transactions includes: aTransfer receiverTransaction).! !


!classDefinition: #Account category: #'Portfolio-TreePrinter'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-TreePrinter'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'cl 10/22/2019 20:33:54'!
initializeWithName: aName

	name := aName.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'accessing' stamp: 'cl 10/22/2019 20:34:24'!
accountName
	^name! !

!Portfolio methodsFor: 'accessing' stamp: 'cl 10/23/2019 16:51:45'!
accounts
	
	^ accounts copy! !


!Portfolio methodsFor: 'report' stamp: 'cl 10/25/2019 13:45:11'!
workAccountsFor: aReport using: partialReportValue 
	
	^accounts inject: partialReportValue into:[:reportValue :account| aReport prepareForReportWith: reportValue andAccount: account].! !

!Portfolio methodsFor: 'report' stamp: 'cl 10/25/2019 14:17:24'!
workTransactionsFor: aReport using: partialReportValue

	^partialReportValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-TreePrinter'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation' stamp: 'cl 10/22/2019 20:32:55'!
named: aName

	^self new initializeWithName: aName. 
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'cl 10/22/2019 20:53:04'!
named: aName with: anAccount 
	^(self with: anAccount) initializeWithName:aName.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'cl 10/22/2019 20:51:58'!
named: aName with: anAccount with: anotherAccount 
	^(self with: anAccount with: anotherAccount) initializeWithName: aName.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-TreePrinter'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'cl 10/22/2019 20:23:32'!
initializeWithName: aName
	name := aName. ! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'cl 10/22/2019 20:24:52'!
accountName
	^name! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'cl 10/23/2019 17:21:28'!
accounts
	^OrderedCollection new! !


!ReceptiveAccount methodsFor: 'report' stamp: 'cl 10/25/2019 14:05:14'!
workAccountsFor: aReport using: partialReportValue

	^partialReportValue! !

!ReceptiveAccount methodsFor: 'report' stamp: 'cl 10/25/2019 14:17:09'!
workTransactionsFor: aReport using: partialReportValue
	
	^transactions inject: partialReportValue into:[:reportValue :transaction| aReport prepareForReportWith: reportValue andTransaction: transaction].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #'Portfolio-TreePrinter'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'cl 10/22/2019 20:20:50'!
named: aString

	^self new initializeWithName: aString. ! !


!classDefinition: #AccountTransaction category: #'Portfolio-TreePrinter'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'accessing' stamp: 'cl 10/21/2019 21:33:04'!
stringToReport
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-TreePrinter'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-TreePrinter'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'cl 10/22/2019 19:39:10'!
prepareForReport: aReport

	^aReport prepareForReportADeposit: self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-TreePrinter'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: #'Portfolio-TreePrinter'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'senderTransaction receiverTransaction value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!Transfer methodsFor: 'accessing' stamp: 'cl 10/21/2019 20:44:15'!
receiverTransaction

	^receiverTransaction! !

!Transfer methodsFor: 'accessing' stamp: 'cl 10/21/2019 20:43:56'!
senderTransaction

	^senderTransaction! !


!Transfer methodsFor: 'value' stamp: 'cl 10/21/2019 20:40:35'!
value

	^value! !


!Transfer methodsFor: 'initialization' stamp: 'cl 10/21/2019 20:30:00'!
establishSender: aSenderTransaction andReceiver: aReceiverTransaction

	senderTransaction := aSenderTransaction.
	receiverTransaction := aReceiverTransaction.! !

!Transfer methodsFor: 'initialization' stamp: 'cl 10/21/2019 20:39:43'!
initializeFor: aValue

	value:= aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-TreePrinter'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 20:28:24'!
for: aValue

	^ self new initializeFor: aValue ! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 20:26:06'!
register: aValue from: aSenderAccount to: aReceiverAccount
	| senderTransaction receiverTransaction totalTransfer|
	
	totalTransfer := self for: aValue.
	
	senderTransaction :=  TransferWithdraw for: totalTransfer.
	aSenderAccount register: senderTransaction.
	
	receiverTransaction :=  TransferDeposit for: totalTransfer.
	aReceiverAccount register: receiverTransaction.
	
	totalTransfer establishSender: senderTransaction andReceiver: receiverTransaction.
	
	^totalTransfer! !


!classDefinition: #TransferDeposit category: #'Portfolio-TreePrinter'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!TransferDeposit methodsFor: 'report' stamp: 'cl 10/23/2019 16:00:13'!
prepareForReport: aReport

	^aReport prepareForReportATransferDeposit: self value.! !


!TransferDeposit methodsFor: 'balance' stamp: 'cl 10/21/2019 20:36:04'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDeposit methodsFor: 'initialization' stamp: 'cl 10/21/2019 20:31:14'!
initializeFor: aTransfer

	transfer:= aTransfer. ! !


!TransferDeposit methodsFor: 'value' stamp: 'cl 10/21/2019 20:34:54'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'Portfolio-TreePrinter'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 20:27:58'!
for: aTransfer

	^ self new initializeFor: aTransfer ! !


!classDefinition: #TransferWithdraw category: #'Portfolio-TreePrinter'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!TransferWithdraw methodsFor: 'report' stamp: 'cl 10/22/2019 16:25:56'!
prepareForReport: aReport

	^aReport prepareForReportATransferWithdraw: self value.! !


!TransferWithdraw methodsFor: 'balance' stamp: 'cl 10/21/2019 20:36:17'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'cl 10/21/2019 20:31:49'!
initializeFor: aTransfer

	transfer:= aTransfer.! !


!TransferWithdraw methodsFor: 'value' stamp: 'cl 10/21/2019 20:35:11'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'Portfolio-TreePrinter'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 20:27:52'!
for: aTransfer

	^ self new initializeFor: aTransfer ! !


!classDefinition: #Withdraw category: #'Portfolio-TreePrinter'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'cl 10/22/2019 16:26:16'!
prepareForReport: aReport

	^aReport prepareForReportAWithdraw: self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-TreePrinter'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: #'Portfolio-TreePrinter'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!Report methodsFor: 'value' stamp: 'cl 10/25/2019 15:09:09'!
value

	self subclassResponsibility ! !


!Report methodsFor: 'initialization' stamp: 'cl 10/25/2019 15:07:29'!
initializeWith: anAccount

	self subclassResponsibility ! !


!Report methodsFor: 'private' stamp: 'cl 10/25/2019 15:07:53'!
prepareForReportADeposit: aValue

	self subclassResponsibility ! !

!Report methodsFor: 'private' stamp: 'cl 10/25/2019 15:08:06'!
prepareForReportATransferDeposit: aValue

	self subclassResponsibility ! !

!Report methodsFor: 'private' stamp: 'cl 10/25/2019 15:08:26'!
prepareForReportATransferWithdraw: aValue

	self subclassResponsibility ! !

!Report methodsFor: 'private' stamp: 'cl 10/25/2019 15:08:41'!
prepareForReportAWithdraw: aValue

	self subclassResponsibility ! !

!Report methodsFor: 'private' stamp: 'cl 10/25/2019 15:08:53'!
prepareForReportWith: reportValue andTransaction: aTransaction

	self subclassResponsibility ! !


!classDefinition: #AccountSummary category: #'Portfolio-TreePrinter'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account endOfSentence beginningOfSentence'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!AccountSummary methodsFor: 'initialization' stamp: 'cl 10/25/2019 14:54:54'!
initializeWith: anAccount
	account := anAccount.
	beginningOfSentence := ''.
	endOfSentence := '.'.! !

!AccountSummary methodsFor: 'initialization' stamp: 'cl 10/25/2019 14:54:54'!
initializeWith: anAccount andBeginningOfSentence: aStringOfTabs
	account := anAccount.
	beginningOfSentence := aStringOfTabs.
	endOfSentence := ''.! !


!AccountSummary methodsFor: 'value' stamp: 'cl 10/25/2019 14:54:54'!
value 
	|totalSummary|
	totalSummary := account workTransactionsFor: self using: ''.
	^totalSummary , beginningOfSentence , 'Balance = ' , account balance asString.! !


!AccountSummary methodsFor: 'private' stamp: 'cl 10/25/2019 10:57:29'!
prepareForReportADeposit: aValue

	^'Deposito por ' , aValue asString! !

!AccountSummary methodsFor: 'private' stamp: 'cl 10/25/2019 10:57:43'!
prepareForReportATransferDeposit: aValue

	^'Entrada por transferencia de ' , aValue asString! !

!AccountSummary methodsFor: 'private' stamp: 'cl 10/25/2019 10:57:58'!
prepareForReportATransferWithdraw: aValue

	^'Salida por transferencia de ' , aValue asString! !

!AccountSummary methodsFor: 'private' stamp: 'cl 10/25/2019 10:58:16'!
prepareForReportAWithdraw: aValue

	^'Extraccion por ' , aValue asString! !

!AccountSummary methodsFor: 'private' stamp: 'cl 10/25/2019 14:54:54'!
prepareForReportWith: reportValue andTransaction: aTransaction
	^reportValue , beginningOfSentence , (aTransaction prepareForReport: self) , endOfSentence , String newLineString ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'Portfolio-TreePrinter'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'cl 10/25/2019 10:48:43'!
with: anAccount

	^self new initializeWith: anAccount 
	! !

!AccountSummary class methodsFor: 'instance creation' stamp: 'cl 10/25/2019 14:55:16'!
with: anAccount andBeginningOfSentence: aStringOfTabs

	^self new initializeWith: anAccount andBeginningOfSentence: aStringOfTabs
	! !


!classDefinition: #TransferNet category: #'Portfolio-TreePrinter'!
Report subclass: #TransferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!TransferNet methodsFor: 'private' stamp: 'cl 10/25/2019 12:17:35'!
prepareForReportADeposit: aValue

	^0! !

!TransferNet methodsFor: 'private' stamp: 'cl 10/25/2019 12:17:47'!
prepareForReportATransferDeposit: aValue

	^aValue! !

!TransferNet methodsFor: 'private' stamp: 'cl 10/25/2019 12:17:59'!
prepareForReportATransferWithdraw: aValue

	^aValue negated! !

!TransferNet methodsFor: 'private' stamp: 'cl 10/25/2019 12:18:12'!
prepareForReportAWithdraw: aValue

	^0! !

!TransferNet methodsFor: 'private' stamp: 'cl 10/25/2019 12:18:23'!
prepareForReportWith: aReportValue andTransaction: aTransaction

	^aReportValue + (aTransaction prepareForReport: self)! !


!TransferNet methodsFor: 'initialization' stamp: 'cl 10/25/2019 12:21:50'!
initializeWith: anAccount 
	
	account := anAccount. 

	! !


!TransferNet methodsFor: 'value' stamp: 'cl 10/25/2019 12:22:44'!
value

	^account workTransactionsFor: self using:0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: #'Portfolio-TreePrinter'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'cl 10/25/2019 15:00:10'!
with: anAccount 

	^self new initializeWith: anAccount! !


!classDefinition: #TreeReport category: #'Portfolio-TreePrinter'!
Report subclass: #TreeReport
	instanceVariableNames: 'account treeReportValue treeLevelMarker'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-TreePrinter'!

!TreeReport methodsFor: 'private' stamp: 'cl 10/25/2019 14:55:16'!
joinAccountForReport
	treeReportValue := treeReportValue , ((AccountSummary with: account andBeginningOfSentence: treeLevelMarker, '	') value) , String newLineString.! !

!TreeReport methodsFor: 'private' stamp: 'cl 10/25/2019 14:51:21'!
joinManagedAccountsToReport
	treeReportValue := treeLevelMarker , account accountName , String newLineString , (account workAccountsFor: self  using: '').! !

!TreeReport methodsFor: 'private' stamp: 'cl 10/25/2019 14:55:16'!
prepareForReportWith: partialReportValue andAccount: anAccount

	^partialReportValue , (self class with: anAccount andBeginningOfSentence: treeLevelMarker, '	') valueWithFinalNewLine .! !

!TreeReport methodsFor: 'private' stamp: 'cl 10/25/2019 14:45:45'!
valueWithFinalNewLine

	self joinManagedAccountsToReport.
	self joinAccountForReport.
	^treeReportValue! !


!TreeReport methodsFor: 'value' stamp: 'cl 10/25/2019 14:36:54'!
value
	^self valueWithFinalNewLine withoutSuffix: String newLineString.! !


!TreeReport methodsFor: 'initialization' stamp: 'cl 10/25/2019 14:51:21'!
initializeWith: anAccount 
	account := anAccount.
	treeLevelMarker :=''.! !

!TreeReport methodsFor: 'initialization' stamp: 'cl 10/25/2019 14:52:38'!
initializeWith: anAccount andTreeLevelMarker: aTreeLevelMarker
	account := anAccount.
	treeLevelMarker := aTreeLevelMarker.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreeReport class' category: #'Portfolio-TreePrinter'!
TreeReport class
	instanceVariableNames: ''!

!TreeReport class methodsFor: 'instance creation' stamp: 'cl 10/25/2019 13:08:18'!
with: anAccount 
	^self new initializeWith: anAccount. ! !

!TreeReport class methodsFor: 'instance creation' stamp: 'cl 10/25/2019 14:55:16'!
with: anAccount andBeginningOfSentence: aStringOfTabs

	^self new initializeWith: anAccount andTreeLevelMarker: aStringOfTabs.! !
