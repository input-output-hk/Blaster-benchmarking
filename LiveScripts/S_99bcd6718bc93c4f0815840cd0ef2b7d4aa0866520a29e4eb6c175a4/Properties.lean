import LiveScripts.Shared
import LiveScripts.S_99bcd6718bc93c4f0815840cd0ef2b7d4aa0866520a29e4eb6c175a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99bcd6718bc93c4f0815840cd0ef2b7d4aa0866520a29e4eb6c175a4.script [ctx] 10000]
