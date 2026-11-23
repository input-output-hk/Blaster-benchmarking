import LiveScripts.Shared
import LiveScripts.S_73acd7d0c1e33bc44a07a7379f9a5f9b5255f06fce95dbf9e9b29b17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73acd7d0c1e33bc44a07a7379f9a5f9b5255f06fce95dbf9e9b29b17.script [redeemer, ctx] 10000]
