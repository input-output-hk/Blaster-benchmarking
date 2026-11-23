import LiveScripts.Shared
import LiveScripts.S_dbfe25556f7da7a0a3ab5f73270eac29a1229ed013f9fbbce903ce05.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dbfe25556f7da7a0a3ab5f73270eac29a1229ed013f9fbbce903ce05.script [ctx] 10000]
