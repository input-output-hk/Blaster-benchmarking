import LiveScripts.Shared
import LiveScripts.S_7eaad6315ed151badb956d0f53dcb45bb41a98d2e9862e11550fe28b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7eaad6315ed151badb956d0f53dcb45bb41a98d2e9862e11550fe28b.script [ctx] 10000]
