// alphabet
func solution(_ s:String, _ n:Int) -> String {
    let alphas = Array("abcdefghijklmnopqrstuvwxyz")
    return String(s.map { c in
        guard let index = alphas.firstIndex(of: Character(c.lowercased())) else { return " " }
        let plused = alphas[(index + n)%alphas.count]
        return c.isLowercase ? plused : Character(plused.uppercased())
    })
}
