import LiveScripts.Shared
import LiveScripts.S_7742360d2928194183537a8836c33876eab53e60d6059d1823dc5086.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7742360d2928194183537a8836c33876eab53e60d6059d1823dc5086.script [ctx] 10000]
