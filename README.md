# ๐ย ๋๊ธฐํ ๋ฉ๋ชจ์ฅ

1. ํ๋ก์ ํธ ๊ธฐ๊ฐ: 2022.02.07 - 2022.02.25
2. ํ์:  [Allie](https://github.com/wooyani77) [์กฐ์ด](https://github.com/na-young-kwon) [์ ์ธ](https://github.com/siwonkim0)
3. Ground Rules
    - ํ์ต ์๊ฐ
        - ์์์๊ฐ 10์
        - ์ ์ฌ์๊ฐ 1์~3์
        - ์ ๋์๊ฐ 7์~9์
    - ์คํฌ๋ผ
        - 10์์ ์คํฌ๋ผ ์์
4. ์ปค๋ฐ ๊ท์น
    1. ๋จ์
        - ๊ธฐ๋ฅ ๋จ์
    - ๋ฉ์ธ์ง
        - ์นด๋ฅด๋ง ์คํ์ผ
        

# ๐ย ๋ชฉ์ฐจ

+ [๐บ ์คํ ํ๋ฉด](#-์คํ-ํ๋ฉด)
- [โจ๏ธ ํค์๋](#-ํค์๋)
- [STEP 1 : ๋ฆฌ์คํธ ๋ฐ ๋ฉ๋ชจ์์ญ ํ๋ฉด UI๊ตฌํ](#STEP-1--๋ฆฌ์คํธ-๋ฐ-๋ฉ๋ชจ์์ญ-ํ๋ฉด-UI๊ตฌํ)
    + [๊ณ ๋ฏผํ๋ ๊ฒ](#1-1-๊ณ ๋ฏผํ๋-๊ฒ)
    + [Trouble Shooting](#1-2-Trouble-Shooting)
    + [๋ฐฐ์ด ๊ฐ๋](#1-3-๋ฐฐ์ด-๊ฐ๋)
- [STEP 2 : ์ฝ์ด๋ฐ์ดํฐ DB ๊ตฌํ](#STEP-2--์ฝ์ด๋ฐ์ดํฐ-DB-๊ตฌํ)
    + [๊ณ ๋ฏผํ๋ ๊ฒ](#2-1-๊ณ ๋ฏผํ๋-๊ฒ)
    + [Trouble Shooting](#2-2-Trouble-Shooting)
    + [๋ฐฐ์ด ๊ฐ๋](#2-3-๋ฐฐ์ด-๊ฐ๋)
  



# ์คํํ๋ฉด

|์๋ก์ด ๋ฉ๋ชจ ์ถ๊ฐ ๋ฐ ์์ |๋ฉ๋ชจ ์ญ์  ๋ฐ ๊ณต์ |
|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/74536728/154419454-eec815b8-6383-4615-a4fb-dde1124846c2.gif" width="100%" height="100%">|![](https://i.imgur.com/CbAmiOu.gif)|




## Keyword

- `Core Data` `NSPersistentContainer`
    - `NSFetchRequest` `NSPredicate` `NSSortDescriptor`
    - `NSManagedObject` `NSManagedObjectContext`
- `UISplitViewController`
- `DateFormatter`
- `UITapGestureRecognizer`
- `Collection`  `subscript`
- `NavigationItem` `UIBarButtonItem`
- `UIActivityViewController` `UIAlertController`
    - `popoverPresentationController`
- `UITextView`
    - `UITextViewDelegate`
- `UITableView`
    - `UISwipeActionsConfiguration`
    - `selectRow` `deleteRows`
    - `UITableViewCell` `defaultContentConfiguration`
        - `NSMutableAttributedString`
        - `setSelected` `selectedBackgroundView`


# STEP 1 : ๋ฆฌ์คํธ ๋ฐ ๋ฉ๋ชจ์์ญ ํ๋ฉด UI๊ตฌํ

๋ฆฌ์คํธ ํ๋ฉด๊ณผ ๋ฉ๋ชจ์์ญ ํ๋ฉด์ SplitViewController๋ฅผ ํ์ฉํ์ฌ ๊ตฌํํฉ๋๋ค.

## 1-1 ๊ณ ๋ฏผํ๋ ๊ฒ

### ์๋ฐฉํฅ ๋ธ๋ฆฌ๊ฒ์ดํธ๋ก ๋ฉ๋ชจ ๋ชฉ๋ก๊ณผ ์์ธํ์ด์ง๊ฐ ๋ฐ์ดํฐ ์ ๋ฌ

๋ฉ๋ชจ ๋ชฉ๋ก์ ํ์ด๋ธ๋ทฐ ํ์์ผ๋ก ๊ฐ์ง๊ณ ์๋ `MemoListViewController` ์, ๋ฉ๋ชจ์ ๋ด์ฉ์ ํ์ํ๋ `memoDetailViewController` ๊ฐ์ ๋ฐ์ดํฐ ์ ๋ฌ์ ์ํ์ฌ ์๋ฐฉํฅ์ผ๋ก delegation ๊ด๊ณ๋ฅผ ๊ตฌํํ์์ต๋๋ค.

`MemoListViewController`๋ ํ์ด๋ธ๋ทฐ ์์ด ์ ํ๋๋ฉด UITableViewDelegate ๋ฉ์๋ didSelectRowAt์์ `MemoDetailViewControllerDelegate` ํ๋กํ ์ฝ์ ์ฑํํ `memoDetailViewController` ์๊ฒ Memo ์ธ์คํด์ค๋ฅผ ์ ๋ฌํ์ฌ ํ์คํธ๋ทฐ์ ํ์ํ  ๋ฐ์ดํฐ๋ฅผ ์ ๋ฌํฉ๋๋ค.

`memoDetailViewController`๋ ์ฌ์ฉ์๊ฐ ๋ฉ๋ชจ์ ๋ด์ฉ์ ์์ ํ๋ฉด `MemoListViewControllerDelegate`์ ์ฑํํ `MemoListViewController` ์๊ฒ ๋ณ๊ฒฝ๋ ํ์คํธ๋ทฐ์ ๋ด์ฉ์ ์ ๋ฌํ์ฌ ์์ ์ฌํญ์ ๋ฉ๋ชจ ๋ชฉ๋ก์ ๋ฐ์ํฉ๋๋ค.

### NSAttributedString๊ณผ defaultContentConfiguration์ ์ด์ฉํ ํ์ด๋ธ ๋ทฐ ์ ๊ตฌ์ฑ

<img src="https://i.imgur.com/JXo1jzg.png" width="50%" height="50%">

- subtitle์์ ๋ ์ง์ ๋ฉ๋ชจ ๋ณธ๋ฌธ์ ๋ค๋ฅธ attribute๋ฅผ ์ ์ฉํ๊ธฐ ์ํด NSAttributedString์ ์ฌ์ฉํ์ต๋๋ค
- ๋ ์ง๋ footnote, ๋ณธ๋ฌธ์ caption1 + secondaryLabel ์์์ผ๋ก ๊ตฌ์ฑํ์ต๋๋ค.

```swift
let attributedString = NSMutableAttributedString()

attributedString.append(NSAttributedString(
    string: dateString + " ",
    attributes: [.font: UIFont.preferredFont(forTextStyle: .footnote)]
))

attributedString.append(NSAttributedString(
    string: truncatedBody,
    attributes: [
        .font: UIFont.preferredFont(forTextStyle: .caption1),
        .foregroundColor: UIColor.secondaryLabel
    ]
))
```

### UISwipeActionsConfiguration ์ฌ์ฉ

TableView์ Cell์ swipeํ  ๋ ๊ณต์  ๋ฐ ์ญ์  ๊ธฐ๋ฅ์ ์ํ ์ก์๋ฒํผ์ด ๋์์ง๋๋ก ๊ตฌํํ์ต๋๋ค.

<img src="https://i.imgur.com/n5FNemO.png" width="50%" height="50%">

### ์ดํ์ ์คํ์ ๋ฐ๋ฅธ selectRow(at:) ํธ์ถ

- ์ฑ์ด ์ฒ์ ๊ตฌ๋๋  ๋ ์ฒซ๋ฒ์งธ ์์ด ์ ํ๋๋๋ก ํ์ต๋๋ค.
- ๋ฉ๋ชจ๋ฅผ ์ถ๊ฐํ์ ๋ ์ถ๊ฐํ ์๋ก์ด ๋ฉ๋ชจ๋ฅผ select ํฉ๋๋ค.
- ๋ฉ๋ชจ๋ฅผ ์ญ์ ํ์ ๋๋ ์ญ์ ํ๋ฉ๋ชจ์ ๋ค์ ๋ฉ๋ชจ๋ฅผ ์๋์ผ๋ก select ํฉ๋๋ค.

์ด๋ค ๋ฉ๋ชจ๋ฅผ ์ ํํด์ ์์ฑํ๊ณ  ์๋์ง ์๋ฆฌ๊ธฐ ์ํด ์์ฑ์ค์ธ ์์ด ๊ณ์ select ๋๋๋ก ๊ตฌํํ์ต๋๋ค.

### ํค๋ณด๋์ text ๊ฐ๋ฆผํ์ ๊ฐ์ 

`NotificationCenter`๋ฅผ ํ์ฉํ์ฌ ํค๋ณด๋๊ฐ ํ๋ฉด์ ํ์๋  ๋, textView์ text๋ฅผ ๊ฐ๋ฆฌ์ง ์๋๋ก contentInset์ ํค๋ณด๋์ ๋์ด์ ๊ฐ๊ฒ ์กฐ์ ํ๊ณ , `textView.isEditable`์ ์ฌ์ฉํ์ฌ ๋ฉ๋ชจ๊ฐ ์์ ๋ textView๋ฅผ ์์ ํ  ์ ์๋๋ก ๊ตฌํํ์ต๋๋ค.

<img src="https://user-images.githubusercontent.com/74536728/154416221-22c394ea-9025-4e51-b4e7-f19d7dae4cf5.gif" width="50%" height="50%">

### ์์ ํ๊ฒ ๋ฐฐ์ด ์กฐํ

๋ฐฐ์ด์์ ์กด์ฌํ์ง์๋ ์ธ๋ฑ์ค๋ฅผ ์กฐํํ์ ๋ Crash๊ฐ ๋์ง ์๋๋ก subscript๋ฅผ ํ์ฉํ์ฌ ์์ ํ๊ฒ ์กฐํํ  ์ ์๋๋ก ํ์ต๋๋ค.

```swift
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
```

## 1-2 Trouble Shooting

### 1. GestureRecognizer์ cancelsTouchesInView ๊ธฐ๋ณธ๊ฐ true

- GestureRecognizer๋ฅผ ViewController์ ์ถ๊ฐํ์ UITableView์ ์์ด ํฐ์น๋์ง ์๋ ํ์์ด ๋ํ๋ฌ์ต๋๋ค.
- `์์ธ` ๊ทธ ์ด์ ๋ GestureRecognizer์ ํ๋กํผํฐ cancelsTouchesInView์ ๊ธฐ๋ณธ๊ฐ์ด `true`์ด๊ธฐ ๋๋ฌธ์๋๋ค. ์ ์ค์ฒ๋ง ์ธ์ํ ํ ๋๋จธ์ง ํฐ์น์ ๋ณด๋ค์ ๋ทฐ๋ก ์ ๋ฌํ์ง ์๊ณ  ์ทจ์ํ๊ธฐ ๋๋ฌธ์ UITableView์ UITableViewDelegate ๋ฉ์๋๊ฐ ์๋ํ์ง ์์์ต๋๋ค.
- `ํด๊ฒฐ` ๋ฐ๋ผ์ cancelsTouchesInView๊ฐ์ `false`๋ก ํ ๋นํด์ค์ผ๋ก์จ ์ ์ค์ฒ๋ฅผ ์ธ์ํ ํ์๋ Gesture Recognizer์๋ ๋ฌด๊ดํ๊ฒ ํฐ์น ์ ๋ณด๋ค์ ๋ทฐ์ ์ ๋ฌํ  ์ ์๊ฒ ๋์์ต๋๋ค.

### 2. ์ ์ ํ์ด ์ ์ง๋์ง ์๋ ๋ฌธ์ 

|์์  ์ |์์  ํ|
|:---:|:---:|
|<img src="https://i.imgur.com/6nMVmAh.gif" width="50%" height="50%">|<img src="https://i.imgur.com/bhur7K6.gif" width="50%" height="50%">|

- `์์ธ` tableView์ `allowsSelectionDuringEditing` ํ๋กํผํฐ์ ๋ํดํธ๊ฐ false์๊ธฐ ๋๋ฌธ์ ์์ ํ์ด ๋์ง์์์ต๋๋ค.
- `ํด๊ฒฐ`  `allowsSelectionDuringEditing` ๋ฅผ true๋ก ๋ฐ๊ฟ์ฃผ์์ต๋๋ค. ์์ ์ง์ด ํ์๋ ์์ ํ์ด ๋จ์์๋๋ก ํ๊ธฐ ์ํด `didEndEditingRowAt`์์๋ indexPath์ ํด๋นํ๋ row๋ฅผ selectํ๋ ๋ก์ง์ ์ถ๊ฐํ์ต๋๋ค.
    
    ```swift
    // ์์ ์ง์ฐ๋ ๋์ editing์ ํ  ์ ์๋๋ก true๋ก ๋ณ๊ฒฝ
    tableView.allowsSelectionDuringEditing = true
    tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
    
    // ์ ์์ ์ด ๋๋ ํ์๋ ์์ selectํ๋ ๋ก์ง ์ถ๊ฐ
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
      guard let indexPath = indexPath else {
          return
      }
      tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
    }
    ```
    

### 3. ๋ง์ง๋ง ์์ ์ง์ ์ ๋ index ์ค๋ฅ๊ฐ ๋๋ ๋ฌธ์ 

```swift
Thread 1:
"Attempted to scroll the table view to an out-of-bounds row (0) when there are only 0 rows in section 0.
Table view: <UITableView: 0x13f031400;
frame = (0 0; 420 834);
clipsToBounds = YES;
autoresize = W+H; gestureRecognizers = <NSArray: 0x600000031680>;
layer = <CALayer: 0x600000ec7b80>; contentOffset: {0, -74};
contentSize: {420, 72.5}; adjustedContentInset: {74, 0, 20, 0};
dataSource: <CloudNotes.MemoListViewController: 0x14880fad0>>"
```

- `์์ธ`  ์์ ์ง์ด ํ ๋ค์ ์์ selectํด์ฃผ๋๋ฐ, ๋งจ ๋ง์ง๋ง ์์ ์ง์ฐ๋ฉด selectํ  row๊ฐ ๋จ์์์ง ์์์ index ์ค๋ฅ๊ฐ ๋ฐ์ํ์ต๋๋ค.
- `ํด๊ฒฐ`  ์กฐ๊ฑด๋ฌธ์ผ๋ก ์ง์ฐ๋ ค๋ ์์ row๊ฐ ๋จ์์๋ ๋ฉ๋ชจ์ ๊ฐ์๋ณด๋ค ์์๋๋ง `tableView.selectRow(at: indexPath)` ๋ฅผ ํ๋๋ก ๋ถ๊ธฐํด์ฃผ์์ต๋๋ค. ์ถ๊ฐ๋ก ๋งจ ๋ง์ง๋ง ์์ ์ง์ฐ๋ ๊ฒฝ์ฐ detailViewController๊ฐ ๋น์ด์๋ ํ์คํธ๋ทฐ๋ฅผ ๋ณด์ฌ์ฃผ๋๋ก ๊ตฌํํ์ต๋๋ค.

```swift
private func deleteMemo(at indexPath: IndexPath) {
    let deletedMemo = MemoDataManager.shared.memos[indexPath.row]
    MemoDataManager.shared.memos.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .none)
    MemoDataManager.shared.deleteMemo(id: deletedMemo.id)
    
    if indexPath.row < MemoDataManager.shared.memos.count {
        let memo = MemoDataManager.shared.memos[indexPath.row]
        delegate?.memoDetailViewController(showTextViewWith: memo)
        tableView.allowsSelectionDuringEditing = true
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
    } else {
		// ๋งจ ๋ง์ง๋ง ์์ ์ง์ฐ๋ ๊ฒฝ์ฐ
        delegate?.showEmptyTextView()
    }
}

func showEmptyTextView() {
    textView.isEditable = false
    textView.text = ""
}
```

## 1-3 ๋ฐฐ์ด ๊ฐ๋

- ์ฝ๋๋ก ๋ทฐ ๊ตฌํํ๊ธฐ: SceneDelegate ์์ initial View Controller ์ค์ 
    
    ### ์ฝ๋๋ก ๋ทฐ ๊ตฌํํ๊ธฐ: SceneDelegate ์์ initial View Controller ์ค์ 
    
    - ์คํ ๋ฆฌ๋ณด๋๋ฅผ ์ง์ด ํ SceneDelegate์ scene๋ฉ์๋์์ window์ rootViewController๋ฅผ ์ฑ์ ์ฒซํ๋ฉด์ ๋ณด์ด๋ splitViewController๋ก ์ค์ ํํฉ๋๋ค.
    - ๊ทธ๋ฆฌ๊ณ  `makeKeyAndVisible()`๋ก ํ๋ฉด์ ๋ณด์ด๋๋ก ์ค์ ํ์ฌ ์คํ ๋ฆฌ๋ณด๋์์ initial view controller๋ก ์ง์ ํ๋ ๊ฒ์ ๋์ ํด์ค ์ ์์ต๋๋ค.
    
    ```swift
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        window = UIWindow(windowScene: windowScene)
        let splitViewController = SplitViewController(style: .doubleColumn)
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
    }
    ```
    
- BarButtonItem ํ์ฉ
    
    ### BarButtonItem ํ์ฉ
    
    - UIViewController์ ์๋ `navigationItem` ํ๋กํผํฐ๋ฅผ ์ฌ์ฉํ์ฌ navigationbar์ ํ์ํ item์ ์ค์ ํด์ค ์ ์๋ค.
    - `UIBarButtonItem`์ ์์ฑ์์๋ barButtonSystemItem์ด๋ image๋ฅผ ๋ฐ์์ ์ํ๋ ๋๋ก ์ค์ ํด ์ฌ์ฉํ  ์ ์๋ค.
    
    ```swift
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, 
    																		target: self, 
    																		action: #selector(addMemo))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = "๋ฉ๋ชจ"
    }
    
    private func setupNavigationItem() {
    		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
    																												style: .plain,
    																												target: self,
    																												action: #selector(viewMoreButtonTapped))
    }
    ```
    
- UISplitViewController
    
    ### UISplitViewController
    
    - `setViewController(_:for:)` : UISplitViewController์ ๋ฉ์๋๋ก Double Column ์คํ์ผ์ธ ๊ฒฝ์ฐ์ primary์ secondary ๋ทฐ์ปจํธ๋กค๋ฌ๋ฅผ ์ง์ ํฉ๋๋ค.
    - ์ด ๋ฉ์๋๋ก ์ง์ ํ๋ ๊ฒฝ์ฐ์ ์๋์ผ๋ก ๋ทฐ์ปจํธ๋กค๋ฌ์ ๋ค๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ๋ฅผ ๊ฐ์ธ์
    UISplitViewController์ ํ ๋นํด์ฃผ์์ต๋๋ค.
    - preferredDisplayMode = .oneBesideSecondary ๋ก ์ฑ ์ด๊ธฐ ํ๋ฉด์์ ์ผ์ชฝ์ ๋ฉ๋ชจ ๋ชฉ๋ก, ์ค๋ฅธ์ชฝ์ ๋ฉ๋ชจ ์์ธํ๋ฉด์ด ๊ฐ์ด ๋์ค๋๋ก ์ค์ ํ์์ต๋๋ค.
    
    ```swift
    class SplitViewController: UISplitViewController {
        private let listViewController = MemoListViewController()
        private let detailViewController = MemoDetailViewController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupChildView()
            setupDisplay()
            listViewController.delegate = detailViewController
            detailViewController.delegate = listViewController
            hideKeyboard()
        }
        
        private func setupChildView() {
            setViewController(listViewController, for: .primary)
            setViewController(detailViewController, for: .secondary)
        }
        
        private func setupDisplay() {
            preferredSplitBehavior = .tile
            preferredDisplayMode = .oneBesideSecondary
        }
    }
    ```
    

# STEP 2 : ์ฝ์ด๋ฐ์ดํฐ DB ๊ตฌํ

๋ฉ๋ชจ๋ฅผ ์ํ ์ฝ์ด๋ฐ์ดํฐ ๋ชจ๋ธ์ ์์ฑํฉ๋๋ค.

## 2-1 ๊ณ ๋ฏผํ๋ ๊ฒ

### ์ฝ์ด๋ฐ์ดํฐ๋ฅผ ๊ด๋ฆฌํ๋ ๋งค๋์  ํ์ ๊ตฌํ

- ๋ฐ์ดํฐ๋ฅผ ๊ด๋ฆฌํ๋ ํ์์ธ `MemoDataManager` ๋ฅผ ๊ตฌํํ์ต๋๋ค.
    - fetchํด์จ ๋ฐ์ดํฐ๋ฅผ ์ ์ฅํด ๋๋ memos ๋ฐฐ์ด์ ๊ฐ์ง๊ณ  ์์ต๋๋ค.
    - CoreData๋ฅผ ์์ฑ, ์ญ์ , ์กฐํ, ์๋ฐ์ดํธ๋ฅผ ๋ด๋นํฉ๋๋ค.

### ์ฌ์ฉ์ ์นํ์ ์ธ UI ๊ตฌํ

๋ฉ๋ชจ๊ฐ ์ถ๊ฐ๋๊ฑฐ๋ ์์ ๋  ๋ ์ต์ ์์ผ๋ก ์ ๋ ฌํ์ฌ TableView์ ๋ณด์ฌ์ค ์ ์๋๋ก ๋ ์ง๋ฅผ ๊ธฐ์ค์ผ๋ก ์ ๋ ฌํ์ต๋๋ค.

๋ฉ๋ชจ๋ฆฌ์คํธ ๋ทฐ์์๋ Swipeํด์ share ๋ฒํผ์ ๋๋ ์ ๋, UIActivityView๋ฅผ ํ๋ฉด ์ค์์ ๋ณด์ฌ์ฃผ๋๋ก ํด์ฃผ์๊ณ , ์์ธํ์ด์ง์ barButtonItem์์ share ๋ฒํผ์ ๋๋ ์ ๋๋, ํด๋น ๋ฒํผ์์๋ถํฐ UIActivityView๊ฐ ๋ณด์ฌ์ง๋๋ก ํ์ต๋๋ค.

|Swipeํด์ share ๋ฒํผ์ ๋๋ ์ ๋|barButtonItem์์ share ๋ฒํผ์ ๋๋ ์ ๋|
|:---:|:---:|
|<img src="https://i.imgur.com/Yn4FJqW.png" width="50%" height="50%">|<img src="https://i.imgur.com/28ZUpZF.png" width="50%" height="50%">|

### ์์ดํจ๋์์ popoverPresentationController์ ์ฌ์ฉ

- ์ค๋ฅ๋ฉ์ธ์ง

์์ดํฐ์์๋ ์ ๋์์ง๋ UIAlertController๋ UIActivityViewController๊ฐ ์์ดํจ๋ ํ๊ฒฝ์์๋ ์๋ํ์ง ์์์ต๋๋ค. 

```
Thread 1: "Your application has presented a UIAlertController (<UIAlertController: 0x10d813a00>) of style UIAlertControllerStyleActionSheet from CloudNotes.SplitViewController (<CloudNotes.SplitViewController: 0x11f7068f0>).
The modalPresentationStyle of a UIAlertController with this style is UIModalPresentationPopover.
You must provide location information for this popover through the alert controller's popoverPresentationController.
You must provide either a sourceView and sourceRect or a barButtonItem.
If this information is not known when you present the alert controller, you may provide it in the UIPopoverPresentationControllerDelegate method -prepareForPopoverPresentation."

```

popoverPresentationController๋ฅผ ์ฌ์ฉํ์ฌ ์ผ๋ฟ์ด ๋์์ง ์์น๋ฅผ sender๋ ๋ทฐ์ ํน์ ํ ์์น๋ก ๋ช์๋ฅผ ํ์ฌ ํด๊ฒฐํ์ต๋๋ค.

- sender๋ฅผ ์ค ๊ฒฝ์ฐ

```swift
private func showAlert(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    // ์ฝ๋ ์๋ต
    if let popoverController = alert.popoverPresentationController {
        popoverController.barButtonItem = sender
    }
    present(alert, animated: true, completion: nil)
}
```

- ์ขํ๋ฅผ ์ค์ ํด์ค ๊ฒฝ์ฐ

```swift
private func showActivityView(indexPath: IndexPath) {
    //์ฝ๋ ์๋ต
    let activityViewController = UIActivityViewController(activityItems: [memoToShare], applicationActivities: nil)
    
    if let popOver = activityViewController.popoverPresentationController {
        popOver.sourceView = splitViewController.view
        popOver.sourceRect = CGRect(x: splitViewController.view.bounds.midX,
                                    y: splitViewController.view.bounds.midY,
                                    width: 0,
                                    height: 0)
        popOver.permittedArrowDirections = []
    }
    present(activityViewController, animated: true)
}
```

<img src="https://i.imgur.com/1Dv8067.png" width="50%" height="50%">

[๊ด๋ จ ๊ณต์๋ฌธ์ ๋งํฌ: Displaying Transient Content in a Popover](https://developer.apple.com/documentation/uikit/windows_and_screens/displaying_transient_content_in_a_popover)

## 2-2 Trouble Shooting

### UITableView์ Cell์ deleteRows(at:) ๋ฉ์๋๋ก ์ญ์ ํ์ ๋ ๋ฐ์ํ ์๋ฌ

```
Thread 1:
"Invalid update: invalid number of rows in section 0.
The number of rows contained in an existing section after the update (26) must be equal to the number of rows contained in that section before the update (26), plus or minus the number of rows inserted or deleted from that section (0 inserted, 1 deleted) and plus or minus the number of rows moved into or out of that section (0 moved in, 0 moved out).
```

- `์ํฉ` tableView ์น์์ row ๊ฐ์์ ์ค์  ๋ณด์ฌ์ค ์น์์ ๊ฐ์๊ฐ ๋ง์ง ์์์ ๋ฐ์ํ๋ ์ค๋ฅ์๋๋ค.
- `์ด์ ` tableView์ ์์ ์ญ์ ํ๋ฉด์ tableView์ ๋ณด์ฌ์ค ๋ฐ์ดํฐ๋ ๊ฐ์ด ์ญ์  ํด์ฃผ์ด์ผ ํ๋๋ฐ, ๊ทธ ๊ณผ์ ์ด ๋๋ฝ์ด๋์ด ๋ฐ์ํ ๊ฒ์ผ๋ก ๋ณด์๋๋ค.
- `ํด๊ฒฐ` ์์ ์ถ๊ฐ ๋ฐ ์ญ์ ํ  ๋ tableView์ ๋ณด์ฌ์ค ์น์์ ๊ฐ์๋ ๋์ผํ๋๋ก `MemoDataManager`์ ๋ฉ๋ชจ์ ์ฝ์ด๋ฐ์ดํฐ์ ์ ์ฅ๋ ๋ฉ๋ชจ๋ฐ์ดํฐ๋ ์ญ์  ํด์ฃผ์์ต๋๋ค.

### ํ์คํธ๋ทฐ๊ฐ ๋ณํ ๋๋ง๋ค ๋ฉ๋ชจ๊ฐ ์ ์ฅ๋๋ ๋ฌธ์ 

|์์ฑ ์ค์ผ๋|์ฑ์ ๋ค์ ์คํํด์ ์ฝ์ด๋ฐ์ดํฐ์์ fetchํด์์ ๋|
|:---:|:---:|
|<img src="https://i.imgur.com/yzjlrDt.png" width="50%" height="50%">|<img src="https://i.imgur.com/3ULs2Tt.png" width="50%" height="50%">|



- `์ํฉ` ํ์คํธ๋ทฐ์ ์ฌ๋ฌ ๊ธ์๋ฅผ ์ ๊ณ , ์ฑ์ ๋ค์ ๊ตฌ๋ํ๋ฉด ์ค๋ฅธ์ชฝ ์ฌ์ง์ฒ๋ผ ํ๊ธ์์ฉ ๋ฉ๋ชจ๊ฐ ์ฌ๋ฌ๊ฐ ์๊ธฐ๋ ์ค๋ฅ์๋๋ค.
- `์ด์ ` ํ์คํธ๋ทฐ๊ฐ ์์ ์ด ๋  ๋๋ง๋ค ์ฝ์ด๋ฐ์ดํฐ์ ์ ์ฅ์ด ๋๊ธฐ ๋๋ฌธ์ ๋ฐ์ํ ๋ฌธ์ ์์ต๋๋ค.
    - DetailViewController์์ `currentMemo` ๋ผ๋ ์ฐ์ฐํ๋กํผํฐ๋ก ํ์ฌ ๋ฉ๋ชจ์ ์ ๊ทผํ๋๋ฐ,
    - ๊ทธ ์์์ ๋ง๋ค์ด์ฃผ๋ Memo ํ์์ ์ด๋์๋ผ์ด์ฆ ํ ๋ ์ฝ์ด๋ฐ์ดํฐ์ context๊ฐ ์ฐ์ด๋ฉด์ ๊ธ์๋ฅผ ์์ ํ ์๋งํผ ๋ฉ๋ชจ๊ฐ ์ ์ฅ์ด ๋๊ณ ,
    - fetch๋ฅผ ํด์ฌ ๋ ํ ๊ธ์์ฉ ์ ์ฅ ๋ ๋ชจ๋  ๋ฉ๋ชจ๋ค์ ๋ถ๋ฌ์ค๋ฉด์ ํ๋์ ๋ฉ๋ชจ๋ฅผ ์์ ํ์ง๋ง, ์์ ํ ๊ธ์ ์๋๋ก ์๋ก์ด ๋ฉ๋ชจ๋ค์ด ์๊ธฐ๋ ํ์์ด ๋ฐ์ํ์์ต๋๋ค.

<์์  ์ >

```swift
extension MemoDetailViewController: UITextViewDelegate {
		private var currentMemo: Memo {
        let memoComponents = textView.text.split(
            separator: "\n",
            maxSplits: 1
        ).map(String.init)
        
        **let memo = Memo(context: MemoDataManager.shared.viewContext)**
        memo.title = memoComponents[safe: 0] ?? ""
        memo.body = memoComponents[safe: 1] ?? ""
        memo.lastModified = Date()
        
        return memo
    }

    func textViewDidChange(_ textView: UITextView) {
        delegate?.memoListViewController(updateTableViewCellWith: currentMemo)
    }
}

```

ํ๋ฆฐํธ๋ฌธ์ผ๋ก ์ถ๋ ฅํด๋ณธ ๊ฒฐ๊ณผ `context`์ ์๋ ๊ธ์๊ฐ ์๋ ฅํ  ๋ ๋ง๋ค ๋์ด๋์ง๋ง, `๋ฉ๋ชจ`์ ์๋ ๋ณํจ์ด ์๋๊ฒ์ ํ์ธํ  ์ ์์์ต๋๋ค.

<img src="https://i.imgur.com/If3slj0.png" width="20%" height="20%">

```swift
extension MemoListViewController: MemoListViewControllerDelegate {
		func memoListViewController(updateTableViewCellWith memo: Memo) {
		    guard let indexPath = tableView.indexPathForSelectedRow else {
		        return
		    }
		    let request = NSFetchRequest(entityName: "Memo")
				//context์ ์๊ฐ ๊ธ์ ์๋ ฅํ ๋๋ง๋ค ๋์ด๋จ 
		    print(try? MemoDataManager.shared.viewContext.count(for: request))
				
		    MemoDataManager.shared.memos[indexPath.row] = memo
				//๋ฉ๋ชจ์ ์๋ ๊ทธ๋๋ก 
		    print(MemoDataManager.shared.memos.count)
		    tableView.reloadRows(at: [indexPath], with: .none)
		    tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
		}
}
```

- `ํด๊ฒฐ`  ์ฝ์ด๋ฐ์ดํฐ์ `Memo(context:)` ๊ฐ์ฒด๋ฅผ ์ด์ฉํ์ง ์๊ณ  ๊ทธ๋ฅ ๋ฉ๋ชจ ์์  ํ๋ฉด์์ ๋ฉ๋ชจ ๋ชฉ๋ก์ผ๋ก title, body๋ฅผ ์์ฒด๋ฅผ ์ ๋ฌํ์ฌ ์์ ๋๊ณ  ์๋ ์์ indexPath๋ก MemoDataManager์์ Memo ๋ฅผ ๊ฐ์ ธ์์ MemoDataManager.shared.updateMemo ๋ก ํด๋น Memo๋ฅผ ์์ ํ ํ context๋ฅผ saveํ๋ ๋ฐฉ์์ผ๋ก ํด๊ฒฐํ์ต๋๋ค.

```swift
extension MemoDetailViewController: UITextViewDelegate {
		func textViewDidChange(_ textView: UITextView) {
        let memoComponents = textView.text.split(separator: "\n",
                                                 maxSplits: 1)
                                                .map(String.init)
        
        let title = memoComponents[safe: 0] ?? ""
        let body = memoComponents[safe: 1] ?? ""
        let lastModified = Date()
        
        delegate?.memoListViewController(updateTableViewCellWith: title, body: body, lastModified: lastModified)
    }
}

extension MemoListViewController: MemoListViewControllerDelegate {
		func memoListViewController(updateTableViewCellWith title: String, body: String, lastModified: Date) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let id = MemoDataManager.shared.memos[indexPath.row].id else {
            return
        }
        MemoDataManager.shared.updateMemo(id: id, title: title, body: body, lastModified: lastModified)
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
    }
}

class MemoDataManager {
		func updateMemo(id: UUID,
                    title: String,
                    body: String,
                    lastModified: Date)
		    {
        let predicate = NSPredicate(format: "id == %@", id.uuidString)
        guard let memo = fetchMemos(predicate: predicate).first else {
            return
        }
        memo.title = title
        memo.body = body
        memo.lastModified = lastModified
        saveViewContext()
    }
}
```

### ๋ง์ง๋ง Cell์ ์ญ์ ํ์ ๋, textView์ text๊ฐ ๋จ์์๋ ๋ฌธ์ 

MemoListViewController์ `deleteMemo()` ๋ฉ์๋ ๋ด๋ถ์์ ์กฐ๊ฑด๋ฌธ์ ํตํด ๋ง์ง๋ง Cell์ธ์ง ํ์ธ ํ detailViewController์ ์๋ `showEmptyTextView()` ๋ฉ์๋๋ฅผ ํธ์ถํด textView์ text๋ฅผ ์ด๊ธฐํ ํด์ฃผ์์ต๋๋ค.

```swift
private func deleteMemo(at indexPath: IndexPath) {
    let deletedMemo = MemoDataManager.shared.memos[indexPath.row]
    MemoDataManager.shared.memos.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .none)
    MemoDataManager.shared.deleteMemo(id: deletedMemo.id)
        
    if indexPath.row < MemoDataManager.shared.memos.count {
        let memo = MemoDataManager.shared.memos[indexPath.row]
        delegate?.memoDetailViewController(showTextViewWith: memo)
        tableView.allowsSelectionDuringEditing = true
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
    } else {
        delegate?.showEmptyTextView()
    }
}
```

---

## 2-3 ๋ฐฐ์ด ๊ฐ๋

- UITableViewDelegate ๋ฉ์๋๋ฅผ ํ์ฉํ ์ค์์ดํ ๊ธฐ๋ฅ
    
    ## [UITableViewDelegate ๋ฉ์๋๋ฅผ ํ์ฉํ ์ค์์ดํ ๊ธฐ๋ฅ]
    
    tableView์ Delegate ๋ฉ์๋๋ฅผ ํ์ฉํ์ฌ ์์ ์ค์์ดํ ํ์ ๋ ์ ํํ  ์ ์๋ ์ต์์ ์ ํํ  ์ ์์ต๋๋ค. 
    
    - ์ผ์ชฝ โ ์ค๋ฅธ์ชฝ ์ค์์ดํ
    - ์ค๋ฅธ์ชฝ โ ์ผ์ชฝ ์ค์์ดํ
    
    ```swift
    func tableView(_ tableView: UITableView,
      leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
      ) -> UISwipeActionsConfiguration? {
          // ...
      }
    
    func tableView(_ tableView: UITableView,
          trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
      ) -> UISwipeActionsConfiguration? {
          // ...
      }
    ```


# STEP 2-2 REFACTOR

์ด๋ฒ ์คํ์์๋ ๊ฐ๊ฐ์ ํ์์ ์ญํ ์ ๋ชํํ๊ฒ ๋ถ๋ฆฌํ๋๋ฐ ์ด์ ์ ๋์์ต๋๋ค.

ํ์์ ์ญํ ์ด ์ ๋ถ๋ฆฌ๋๋ค๋ฉด, ๋ค์๊ณผ ๊ฐ์ ์ฅ์ ์ด ์์ต๋๋ค.

1. ์ด๋ค ๋ถ๋ถ์ ๊ณ ์ณ์ผ ํ๋์ง ๊ธ๋ฐฉ ํ์ํ  ์ ์์ด์ ์ ์ง๋ณด์๊ฐ ์ฉ์ดํด์ง๋ค.
2. ์์กด์ฑ์ด ์์ด์ง๊ธฐ ๋๋ฌธ์ ์ฌ์ฌ์ฉ์ฑ์ด ๋์์ง๋ค.
3. ํน์  ํ์์ ๋ํ ์์ ์ด ๋ค๋ฅธ ํ์์ ์ํฅ์ ์ฃผ์ง ์๋๋ค.

1, 2์ฐจ ์์ ์ ๊ฑฐ์ณ์ SplitViewController๊ฐ ๋ชจ๋ธ์ธ MemoDataManager์ ์์ ๋ทฐ์ปจ๋ค์ธ ListViewController / DetailViewController ์ฌ์ด์์ ์ค๊ฐ๋ฅผ ํ๋ ๊ตฌ์กฐ๋ก refactorํ์์ต๋๋ค.

์ด๋ก์จ ๋ชจ๋ธ์ ๋ชจ๋ธ ๊ด๋ จ ๋ก์ง๋ง, ๊ฐ ๋ทฐ์ปจ์ ๊ฐ์์ ๋ทฐ ๊ด๋ จ ๋ก์ง๋ง ๊ฐ์ง๊ณ  ์๋๋ก ๊ตฌ์ฑํ์์ต๋๋ค. 

---

# 1์ฐจ ์์ 

### **์ค๊ณ ๋ชฉ์ **

- ๋ฐ์ดํฐ๋ฅผ ํ๊ณณ์์ ๊ด๋ฆฌํ๊ธฐ
- ListViewController / DetailViewController ์์ model ๊ด๋ จ ๋ก์ง์ ์ต๋ํ ๋์ด๋ด๊ธฐ
- MVC ๋์์ธ ํจํด์ผ๋ก ๊ตฌ์กฐ ์ง๊ธฐ

์ฒ์์๋ SplitViewController๋ฅผ ์ด์ฉํด์ ํ ๊ณณ์์ data๋ฅผ ๊ด๋ฆฌํด์ฃผ๋ ๋ฐฉ๋ฒ์ผ๋ก ๊ณ ๋ฏผ์ ํ์ต๋๋ค. ํ์ง๋ง, SplitViewController๋ ListViewController / DetailViewController์ ๋ง์ฐฌ๊ฐ์ง๋ก ViewController๋ผ๋ ์ ์์ ๊ทธ ๋ํ ๋ฐ์ดํฐ๋ฅผ ๊ด๋ฆฌํด์ฃผ๋ ์ญํ ์ ๋งก๊ธฐ์ ๋ถ์ ์ ํ๋ ์๊ฐ์ด ๋ค์์ต๋๋ค. 

๊ณ ๋ฏผ๋์, DataManager์ ์ธ์คํด์ค๋ฅผ SplitViewController๊ฐ ๊ฐ์ง๊ณ  ์๊ณ , ListVC / DetailVC ์๊ฒ ์ ๋ฌํด์ฃผ๋ ๋ฐฉ์์ผ๋ก ๊ตฌํํ๊ธฐ๋ก ๊ฒฐ์ ์ ํ์ต๋๋ค. 
๊ฒฐ๊ณผ์ ์ผ๋ก ListVC / DetailVC์ SplitViewController์ผ๋ก๋ถํฐ ๋ฐ์ DataManager๋ฅผ ๊ฐ์ง๊ณ  ์๊ณ , DataManager๋ listDelegate / detailDelegate๋ฅผ ๊ฐ์ง๊ณ  ์ํต์ ํ๋ ๊ตฌ์กฐ์๋๋ค.

- ๊ธฐ์กด์ ListVC / DetailVC์์ Model ๊ด๋ จ ๋ก์ง์ด ๋ง์๋ ๋ถ๋ถ์ ๋ชจ๋ DataManager ์์ผ๋ก ์ฎ๊ฒจ์ฃผ์์ต๋๋ค.
    - (ex `if indexPath.row < dataManager.memos.count` ์ด๋ฐ์์ผ๋ก ์กฐ๊ฑด์ ํ์ธํ๋ ๋ถ๋ถ)
- ListVC์ DetailVC๋ ๊ฐ๊ฐ MemoDataManagerListDelegate, MemoDataManagerDetailDelegate๋ฅผ ์ฑํํฉ๋๋ค.
- DataManager๋ ๋ฐ์ดํฐ์ ๋ณํ๊ฐ ์ผ์ด๋  ๋ listDelegate / detailDelegate์๊ฒ ์ผ์ ์ํต๋๋ค.
    - ์๋ฅผ๋ค์ด ์ ์ ๊ฐ ์์ ์ญ์  โ ์ญ์  ์ด๋ฒคํธ๋ฅผ ๋ฐ์ ListVC๊ฐ DataManager์ ๋ฉ๋ชจ์ญ์  ๋ฉ์๋๋ฅผ ํธ์ถ โ DataManager๋ ์กฐ๊ฑด์ ํ์ธํ์ฌ listDelegate / detailDelegate์๊ฒ ์ ์ ํ ์ผ์ ์ํด


## 2-1 ๊ณ ๋ฏผํ๋ ๊ฒ
<details>
<summary>indexPath๋ฅผ ํ์ฉํ์ฌ ํ๋์ ๋ฉ์๋๋ก ListVC์ DetailVC์์ ๋ฉ๋ชจ ์ญ์ </summary>
<div markdown="1">

## indexPath๋ฅผ ํ์ฉํ์ฌ ํ๋์ ๋ฉ์๋๋ก ListVC์ DetailVC์์ ๋ฉ๋ชจ ์ญ์ 

๋ฉ๋ชจ๋ฅผ ์ง์ธ ๋ indexPath๋ฅผ ํ์ฉํด์ ์ง์์ผ ํด์ Core Data์์ ์ ํ๋ ๋ฉ๋ชจ์ indexPath๋ฅผ ๊ฐ์ ธ์ค๋ ๋ฐฉ๋ฒ์ ๋ํด ๊ณ ๋ฏผํ์์ต๋๋ค.
ListVC์ ๋ฉ๋ชจ ๋ชฉ๋ก์์ ์ค์์ดํํด์ ์ญ์ ํ ๋๋ ์ ํ๋ indexPath์ ์ ๋ณด๋ฅผ ๊ฐ์ด ์ ๋ฌํด์ค ์ ์์ง๋ง,
DetailCV์ ๋ฉ๋ชจ ์์ธํ์ด์ง์์ ๋๋ณด๊ธฐ ๋ฒํผ์ผ๋ก ์ญ์ ์์๋ ์ ํ๋ ์์ indexPath๋ฅผ ์ ์ ์์ด์
indexPath๊ฐ ์์ผ๋ฉด ๊ทธ๋๋ก ์ฌ์ฉํ๊ณ , ์์ผ๋ฉด listVC์ selectedCellIndex์์ ์ ํ๋ ์์ ์ธ๋ฑ์ค๋ฅผ ๊ฐ์ ธ์์ listVC์ ์๋ ์ง์ฐ๊ณ  detailVC์ ํ์คํธ๋ ์ง์์ฃผ๋๋ก ๊ตฌ์ฑํ์์ต๋๋ค. 

```swift
final class MemoListViewController: UIViewController {
	func tableView(_ tableView: UITableView,
		       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
	) -> UISwipeActionsConfiguration? {
	    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
		self.dataManager.deleteSelectedMemo(at: **indexPath**)
	    }
	    ...
	}
}
```

```swift
final class MemoDetailViewController: UIViewController {
	private func showDeleteAlert(_ sender: UIBarButtonItem) {
	    ...
	    let delete = UIAlertAction(title: "์ญ์ ", style: .destructive) { _ in
		self.dataManager.deleteSelectedMemo()
	    }
	    ...
	}
}
```

```swift
final class MemoDataManager {
	...
	func deleteSelectedMemo(at indexPath: IndexPath? = nil) {
	    let selectedIndexPath: IndexPath?
	    if indexPath != nil {
		selectedIndexPath = indexPath
	    } else {
		selectedIndexPath = listDelegate?.selectedCellIndex
	    }

	    guard let selectedIndexPath = selectedIndexPath else {
		return
	    }
	    let deletedMemo = memos[selectedIndexPath.row]
	    deleteMemo(id: deletedMemo.id)
	    listDelegate?.deleteCell(at: selectedIndexPath)

	    if selectedIndexPath.row < memos.count {
		let memo = memos[selectedIndexPath.row]
		detailDelegate?.showTextView(with: memo)
		listDelegate?.selectNextCell(at: selectedIndexPath)
	    } else {
		detailDelegate?.showIneditableTextView()
	    }
	}
	...
}
```

</div>
</details>
	
## 2-2 Trouble Shooting
<details>
<summary>์ฑ ์ฒซ ์คํ ํ๋ฉด์์ ์ฒซ๋ฒ์งธ ์์ด ์ ํ๋์ง ์๋ ๋ฌธ์ </summary>
<div markdown="1">

### **์ฑ ์ฒซ ์คํ ํ๋ฉด์์ ์ฒซ๋ฒ์งธ ์์ด ์ ํ๋์ง ์๋ ๋ฌธ์ **

<img src="https://i.imgur.com/RCSVaJz.png" width="50%" height="50%">

์ ์์ ์ผ๋ก ์๋ํ๋ ๋ชจ์ต

### ๋ฌธ์  ์ํฉ

์ฑ์ ์คํํ์ ๋, selectFirstMemo()๊ฐ ์คํ๋๋ฉด์ ์ฒซ๋ฒ์งธ ์์ด ์ ํ๋๊ณ  ํด๋น ์์ ๋ด์ฉ์ detailView์ ๋ณด์ฌ์ค์ผํฉ๋๋ค.
์๋๋ MemoListViewController์ viewDidLoad() ์์ selectFirstMemo()๋ฅผ ํธ์ถ์ฃผ์์ต๋๋ค.
๊ทธ๋ฐ๋ฐ List์ ์์ ์ ํ์ด ๋์ง๋ง, ์ ํ๋ ์์ ์์ธํ์ด์ง๋ ๋ณด์ด์ง ์๋ ๋ฌธ์ ๊ฐ ๋ฐ์ํ์ต๋๋ค. 
๋ฐ๋๋ก MemoDetailViewController์์ viewDidLoad() ์์ selectFirstMemo()๋ฅผ ํธ์ถํ๋ฉด 
์ ํ๋ ์์ ์์ธํ์ด์ง๋ ๋ณด์ด์ง๋ง List์ ์์ ์ ํ์ด ๋์ง ์๋ ๋ฌธ์ ๊ฐ ๋ฐ์ํฉ๋๋ค. 

### ์์ธ

๋ฌธ์ ์ ์์ธ์ selectFirstMemo()๋ฅผ ํธ์ถํ๋ VC์ delegate ๋ฑ๋ก๋ง ์๋ํด์ ๋ฐ์ํ๋ ๊ฒ์ด์์ต๋๋ค.
- ListVC์์ ํธ์ถํ๋ฉด listDelegate๋ง ๋ฑ๋ก๋๊ณ  detailDelegate๋ nil โ ์ฒซ๋ฒ์งธ ์์ด ์ ํ๋์ง๋ง, ์์ธ๋ฉ๋ชจ๋ ๋ณด์ด์ง ์์
- DetailVC์์ ํธ์ถํ๋ฉด detailDelegate๋ง ๋ฑ๋ก๋๊ณ  listDelegate๋ nil โ ์ฒซ๋ฒ์งธ ์์ธ๋ฉ๋ชจ๋ ๋ณด์ด์ง๋ง ์ ์ ํ์ด ์๋จ

```swift
extension MemoDataManager {
    func selectFirstMemo() {
        if memos.isEmpty == false {
            listDelegate?.setupRowSelection()
            detailDelegate?.showTextView(with: memos[0])
        }
    }
}
```

|ListViewController์ viewDidLoad์์ ํธ์ถํ๋ ๋ชจ์ต|detailDelegate๊ฐ nil์ธ ๋ชจ์ต|
|:---:|:---:|
|<img src="https://i.imgur.com/HOFGyRr.png" width="50%" height="50%">|<img src="https://i.imgur.com/LLxnl5I.png" width="50%" height="50%">|


ํด๋น ๋ฉ์๋๋ฅผ ํธ์ถํ์ง ์์ผ๋ฉด delegate์์ ๋ช์ํ๋๋ผ๋ ๋ฌด์๋๋ ํ์์ ํ์ธํ์ต๋๋ค. 
์ข์ธก ์ฌ์ง์ ListViewController์ `viewDidLoad()`์์ `selectFirstMemo()`๋ฅผ ํธ์ถํ๊ณ  ์๋ ์ํ๊ณ , 
listDelegate / detailDelegate๋ฅผ ์ถ๋ ฅํ์ ๋ `detailDelegate` ๋ง nil ์ด ๋์ค๋๊ฒ์ ํ์ธํ  ์ ์์์ต๋๋ค.

### ํด๊ฒฐ
listVC์ `viewDidAppear`์์ `dataManager.selectFirstMemo()` ํธ์ถํ๋ ๋ฐฉ์์ผ๋ก ํด๊ฒฐํ์ต๋๋ค. 

```swift
private let dataManager = MemoDataManager()

private lazy var listViewController = MemoListViewController(dataManager: dataManager)
private lazy var detailViewController = MemoDetailViewController(dataManager: dataManager)

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    dataManager.selectFirstMemo()
}
```

</div>
</details>
	
	
<details>
<summary>๋ฉ๋ชจ๋ฅผ ์ญ์ ํ  ๋ viewContext๋ฅผ saveํ๊ธฐ์ ์ memos ๋ฐฐ์ด์์๋ ์ญ์ ํ์ง ์์ผ๋ฉด Crash๊ฐ ๋๋ ๋ฌธ์ </summary>
<div markdown="1">

### ๋ฉ๋ชจ๋ฅผ ์ญ์ ํ  ๋ viewContext๋ฅผ saveํ๊ธฐ์ ์ memos ๋ฐฐ์ด์์๋ ์ญ์ ํ์ง ์์ผ๋ฉด Crash๊ฐ ๋๋ ๋ฌธ์ 

|saveViewContext๋ฅผ ๋จผ์ ํธ์ถ|saveViewContext๋ฅผ ๋์ค์ ํธ์ถ|
|:---:|:---:|
|<img src="https://i.imgur.com/1n9pMDt.jpg" width="50%" height="50%">|<img src="https://i.imgur.com/beG1DkD.jpg" width="50%" height="50%">|


### ๋ฌธ์  ์ํฉ

์ฒ์์๋ view context ์์ ๋ฉ๋ชจ๋ฅผ ์ญ์ ํ๊ณ ๋์ `viewContext.delete(memoToDelete)`
๋ฐ๋ก view context๋ฅผ save ํ ํ `saveViewContext()`
MemoDataManager๊ฐ ๊ฐ์ง๊ณ  ์๋ memos ๋ฐฐ์ด์์๋ ์ญ์ ํ์์ต๋๋ค.
๊ทธ๋ฌ๋๋ Crash๊ฐ ๋๋ฉฐ ์ฑ์ด ์ค์ง๋์์ต๋๋ค.

### ํด๊ฒฐ

MemoDataManager๊ฐ ๊ฐ์ง๊ณ  ์๋ memos ๋ฐฐ์ด์์๋ ์ญ์ ํด์ค ํ view context๋ฅผ save ํ๋ ๋ฐฉ๋ฒ์ผ๋ก ์์๋ฅผ ๋ฐ๊ฟ์ ํด๊ฒฐํด์ฃผ์์ต๋๋ค.

</div>
</details>
	

# 2์ฐจ ์์ 
### ์ค๊ณ ๋ชฉ์ 

- DataManager๋ UI์ ๊ด๋ จ๋ ์ญํ ์ ํ์ง ์๋๋ค
- SplitVC๋ง DataManager๋ฅผ ๊ฐ๋๋ค
- ListVC / DetailVC์์๋ ๋ฐ์ดํฐ์ ๊ด๋ จ๋ ์์์ ํ์ง ์๋๋ค

1์ฐจ ์์ ์ ํ๊ณ  ๋์, ListVC / DetailVC๊ฐ DataManager๋ฅผ ๊ผญ ์์์ผ ํ๋์ง์ ๋ํด์ ๋ง์ ๊ณ ๋ฏผ์ ํ์ต๋๋ค. DataManager๋ฅผ ์๋ ํ์์ด ๋ง์์ผ๋ก ์ธํด์ DataManager์ ๋ฐ์ํ๋ ์ผ๋ค์ด ์ด๋ป๊ฒ  ๊ด๋ฆฌ๊ฐ ๋๊ณ  ์๋์ง ํ์ํ๊ธฐ ํ๋ค์ด ์ง๊ณ , ์ฒ๋ฆฌ๊ฐ ๋ถ์ฐ๋์ด ์๋ค๊ณ  ์๊ฐํ์ต๋๋ค. 

๊ทธ๋์ DataManager๋ฅผ ๊ฐ๊ฒ๋๋ SplitVC๊ฐ ์ด๋ฌํ ์ผ๋ค์ ๋ด๋นํ๋๋ก ๋ค์ ์ค๊ณํ์ต๋๋ค. SplitVC๊ฐ DataManager๋ฅผ ๊ฐ๋ ์ด์ ๋  `Debug view hierarchy`๋ฅผ ํตํด ํ์ธํด๋ดค์ ๋ ๊ณ์ธต๊ตฌ์กฐ๊ฐ SplitVC๊ฐ ์์ ๋ทฐ์ปจ๋ค์ ์ง์ ์ ์ผ๋ก ์๊ณ  ์๊ธฐ ๋๋ฌธ์ ๋ชจ๋ธ๊ณผ ์ฐ๊ฒฐ๋์ด์ผ ํ๋ ์ปจํธ๋กค๋ฌ๊ฐ SplitVC์ด๋ผ๊ณ  ์๊ฐํ์ต๋๋ค.

๊ธฐ์กด์ ListVC / DetailVC์์ Model ๊ด๋ จ ๋ก์ง๋ค์ ๋ชจ๋ ์์ด์ต๋๋ค. ListVC / DetailVC๋ View๋ฅผ Controllerํ๋ ์ญํ ๋ง ํ๊ณ  ์์ต๋๋ค.
๋, MemoDataManager์ ๋จ์์๋ UI๊ด๋ จ ๋ก์ง๋ค๋ ๋ชจ๋ ์ญ์ ํ์ต๋๋ค.
๊ทธ ์ค๊ฐ์์ SplitVC๊ฐ DataManager์ ์์ ๋ทฐ์ปจ๋ค์ ์ค๊ฐํด์ฃผ๊ณ  ์์ต๋๋ค.
	
	
	
# <์ต์ข ๊ตฌ์กฐ>

<img src="https://i.imgur.com/uar9NND.png" width="50%" height="50%">


`SplitViewController`๋ DataManager์ childViewControllers์ ๋ฉ์์ง๋ฅผ ์ฃผ๊ณ  ๋ฐ๊ณ , ๊ฐ๊ฐ์ childViewController๋ค์ `splitViewController`์๋ง ๋ฉ์์ง๋ฅผ ์ฃผ๊ณ  ๋ฐ๋ ๋ก์ง์๋๋ค.

### ListVC, DetailVC์ delegate = SplitVC

listViewController์ detailViewController์ delegate๋ฅผ SplitVC๋ก ์ง์ ํ์ฌ DataManager์ ๋ฐ์ดํฐ์ ๋ฐ๋ผ SplitVC๊ฐ ListVC์ DetailVC๊ฐ ํ  ์ผ์ ๋์  ํด์ฃผ๋๋ก ๊ตฌํํ์์ต๋๋ค. 

### SOLID - DIP ์์น (์์กด๊ด๊ณ ์ญ์  ์์น)

์์๋ ๋ฒจ ๋ชจ๋์ ํ์๋ ๋ฒจ ๋ชจ๋์ ์์กดํ๋ฉด ์๋๋ค๋ DIP ์์น์ ๋ฐ๋ผ, MemoDataManagable ํ๋กํ ์ฝ์ ์ ์ํ์ฌ SplitVC์ด ์์ฑ๋  ๋ MemoDataManagable ํ๋กํ ์ฝ์ ์ค์ํ๋ ์ด๋ค ํ์์ด๋ผ๋ ์ฃผ์๋  ์ ์๋๋ก ํด์ฃผ์์ต๋๋ค.
	
	
```swift
protocol MemoDataManagable {
    ...
}

extension MemoDataManager: MemoDataManagable {
    ...
}
```

```swift
final class SplitViewController: UISplitViewController {
    private let dataManager: MemoDataManagable
	  ...
    init(style: UISplitViewController.Style, dataManager: MemoDataManagable) {
        self.dataManager = dataManager
        super.init(style: style)
    }
    ...
}
```
	
